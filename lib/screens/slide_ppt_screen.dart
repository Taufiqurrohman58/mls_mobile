import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class SlidePptScreen extends StatefulWidget {
  final String title;
  final String pdfPath;

  const SlidePptScreen({super.key, required this.title, required this.pdfPath});

  @override
  State<SlidePptScreen> createState() => _SlidePptScreenState();
}

class _SlidePptScreenState extends State<SlidePptScreen> {
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load PDF: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFFB84A4A),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(
              child: Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            )
          : PdfPreview(
              build: (format) async {
                final bytes = await DefaultAssetBundle.of(
                  context,
                ).load(widget.pdfPath);
                return bytes.buffer.asUint8List();
              },
              pdfFileName: '${widget.title}.pdf',
              allowPrinting: false,
              allowSharing: false,
              canChangeOrientation: false,
              canChangePageFormat: false,
              dynamicLayout: false,
            ),
    );
  }
}
