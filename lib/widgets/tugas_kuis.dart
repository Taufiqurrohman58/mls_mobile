import 'package:flutter/material.dart';

class TugasKuis extends StatelessWidget {
  final List<Map<String, dynamic>> tasksAndQuizzes;

  const TugasKuis({super.key, required this.tasksAndQuizzes});

  @override
  Widget build(BuildContext context) {
    if (tasksAndQuizzes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/gembira.png',
              width: 120,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            const Text(
              'Tidak Ada Tugas Dan Kuis Hari Ini',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: tasksAndQuizzes.length,
      itemBuilder: (context, index) {
        final item = tasksAndQuizzes[index];
        String iconPath;
        switch (item['type']) {
          case 'quiz':
            iconPath = 'assets/images/ic_quiz.png';
            break;
          case 'tugas':
            iconPath = 'assets/images/ic_tugas.png';
            break;
          default:
            iconPath = 'assets/images/ic_quiz.png';
        }

        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 48, 
                top: 0,
                bottom: 0,
                child: Container(width: 1, color: Colors.grey),
              ),
              Positioned(
                left: 48, 
                top: 32, 
                right: 0, 
                child: Container(height: 1, color: Colors.grey),
              ),
              Positioned(
                top: 8,
                right: 16,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item['completed'] ? Colors.green : Colors.grey[300],
                  ),
                  child: item['completed']
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : const Icon(Icons.check, size: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Image.asset(iconPath, width: 24, height: 24),
                    const SizedBox(width: 12),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ), 
                          if (item['description'] != null) ...[
                            Text(
                              item['description'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
