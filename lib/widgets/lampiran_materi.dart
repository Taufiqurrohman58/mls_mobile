import 'package:flutter/material.dart';

class LampiranMateri extends StatelessWidget {
  final List<Map<String, dynamic>> materials;

  const LampiranMateri({super.key, required this.materials});

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

        return Card(
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
                      : const Icon(Icons.check, size: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
