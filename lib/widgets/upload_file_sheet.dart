import 'dart:math';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double radius;
  final double dashLength;
  final double dashGap;

  DashedBorderPainter({
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
    this.radius = 8.0,
    this.dashLength = 6.0,
    this.dashGap = 4.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    // Draw dashed border
    _drawDashedRRect(canvas, rrect, paint);
  }

  void _drawDashedRRect(Canvas canvas, RRect rrect, Paint paint) {
    final path = Path();
    path.addRRect(rrect);

    final pathMetrics = path.computeMetrics();

    for (final metric in pathMetrics) {
      double length = metric.length;
      double distance = 0.0;

      while (distance < length) {
        double endDistance = distance + dashLength;
        if (endDistance > length) {
          endDistance = length;
        }

        final extractPath = metric.extractPath(distance, endDistance);
        canvas.drawPath(extractPath, paint);

        distance += dashLength + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class UploadFileSheet extends StatefulWidget {
  const UploadFileSheet({super.key});

  @override
  State<UploadFileSheet> createState() => _UploadFileSheetState();
}

class _UploadFileSheetState extends State<UploadFileSheet> {
  final List<FilePickerResult?> _selectedFiles = [];
  bool _isLoading = false;

  Future<void> _pickFiles() async {
    setState(() {
      _isLoading = true;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
        allowCompression: false,
      );

      if (result != null) {
        setState(() {
          _selectedFiles.add(result);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking files: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  String _formatFileSize(int bytes) {
    if (bytes == 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB'];
    int i = (log(bytes) / log(k)).floor();
    return '${(bytes / pow(k, i)).toStringAsFixed(2)} ${sizes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 16,
              left: 24,
              right: 24,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFB84A4A),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const Text(
                  'Upload File',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Align(
              alignment: Alignment.centerRight,
              child: const Text(
                'Maksimum File 5MB, Maksimum Jumlah File 20',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.right,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Upload area container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: CustomPaint(
                  painter: DashedBorderPainter(
                    color: Colors.grey[300]!,
                    strokeWidth: 1.0,
                    dashLength: 6.0,
                    dashGap: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: _selectedFiles.isEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 40),
                              Icon(
                                Icons.cloud_upload_outlined,
                                size: 79,
                                color: Colors.blue,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'File yang akan di upload akan tampil di sini',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40),
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 16),
                              ..._selectedFiles.asMap().entries.map((entry) {
                                int index = entry.key;
                                FilePickerResult? fileResult = entry.value;
                                if (fileResult == null) {
                                  return const SizedBox.shrink();
                                }
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        _getFileIcon(
                                          fileResult.files.first.extension ??
                                              '',
                                        ),
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              fileResult.files.first.name,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              _formatFileSize(
                                                fileResult.files.first.size,
                                              ),
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () => _removeFile(index),
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.red[600],
                                        ),
                                        iconSize: 20,
                                        constraints: const BoxConstraints(
                                          minWidth: 32,
                                          minHeight: 32,
                                        ),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                              const SizedBox(height: 16),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Pilih File button
                GestureDetector(
                  onTap: _isLoading ? null : _pickFiles,
                  child: Container(
                    width: 155,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _isLoading ? Colors.grey[400] : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : const Text(
                            'Pilih File',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                // Simpan button
                GestureDetector(
                  onTap: () {
                    if (_selectedFiles.isNotEmpty) {
                      // TODO: Implement save functionality with selected files
                      Navigator.of(context).pop(_selectedFiles);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Silakan pilih file terlebih dahulu'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 155,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _selectedFiles.isNotEmpty
                          ? Colors.blue
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  IconData _getFileIcon(String extension) {
    switch (extension.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      case 'mp4':
      case 'avi':
      case 'mov':
        return Icons.videocam;
      case 'mp3':
      case 'wav':
        return Icons.audiotrack;
      default:
        return Icons.insert_drive_file;
    }
  }
}
