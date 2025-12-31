import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/slide_ppt_screen.dart';

class LampiranMateri extends StatelessWidget {
  final List<Map<String, dynamic>> materials;

  const LampiranMateri({super.key, required this.materials});

  Future<void> _launchUrl(String url, BuildContext context) async {
    try {
      // Ensure URL has proper scheme
      String formattedUrl = url;
      if (!url.startsWith('http://') && !url.startsWith('https://')) {
        formattedUrl = 'https://$url';
      }
      
      final Uri uri = Uri.parse(formattedUrl);
      
      // Try different launch modes in order of preference
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback: Try in-app web view
        try {
          await launchUrl(
            uri,
            mode: LaunchMode.inAppWebView,
          );
        } catch (webViewError) {
          // If all else fails, show error dialog
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: Text('Unable to Open Link'),
                  content: Text(
                    'Could not open the Zoom meeting link. Please check your internet connection and try again.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    } catch (e) {
      // Show error dialog for any other exceptions
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Could not open the link: $e'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: materials.length,
      itemBuilder: (context, index) {
        final material = materials[index];
        String iconPath;
        switch (material['type']) {
          case 'file_video':
            iconPath = 'assets/images/ic_file_video.png';
            break;
          case 'interactive_content':
            iconPath = 'assets/images/ic_interactive_content.png';
            break;
          case 'url':
            iconPath = 'assets/images/ic_url.png';
            break;
          case 'quiz':
            iconPath = 'assets/images/ic_quiz.png';
            break;
          case 'tugas':
            iconPath = 'assets/images/ic_tugas.png';
            break;
          default:
            iconPath = 'assets/images/ic_file_video.png';
        }

        return InkWell(
          onTap: () {
            if (material['title'] == 'Pengantar User Interface Design') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SlidePptScreen(
                    title: material['title'],
                    pdfPath: 'assets/01_Slide-Pengantar-PAA.pdf',
                  ),
                ),
              );
            } else if (material['title'] == 'Zoom Meeting Syncronous') {
              // Launch Zoom meeting URL
              const zoomUrl =
                  'https://lms.telkomuniversity.ac.id/mod/url/view.php?id=1038446';
              _launchUrl(zoomUrl, context);
            }
          },
          child: Card(
            color: Colors.white,
            margin: const EdgeInsets.all(8),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset(iconPath, width: 24, height: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      material['title'],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: material['completed']
                          ? Colors.green
                          : Colors.grey[300],
                    ),
                    child: material['completed']
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
