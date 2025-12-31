import 'package:flutter/material.dart';
import 'page_tugas_screen.dart';
import 'quiz_screen.dart';

class TugasKuis extends StatelessWidget {
  const TugasKuis({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tasks = [
      {
        'type': 'quiz',
        'title': 'Quiz Review 01',
        'completed': true,
        'deadline': '26 Februari 2021 23:59 WIB',
      },
      {
        'type': 'tugas',
        'title': 'Tugas 01 - UID Android Mobile Game',
        'completed': false,
        'deadline': '26 Februari 2021 23:59 WIB',
      },
      // Add more tasks as needed
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 40),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final iconPath = task['type'] == 'quiz'
              ? 'assets/images/ic_quiz.png'
              : 'assets/images/ic_tugas.png';
          final typeLabel = task['type'] == 'quiz' ? 'Quiz' : 'Tugas';

          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            elevation: 0,
            child: InkWell(
              onTap: () {
                if (task['title'] == ' Tugas 01 - UID Android Mobile Game' ||
                    task['title'] == 'Tugas 01 - UID Android Mobile Game') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PageTugasScreen(title: task['title'].trim()),
                    ),
                  );
                } else if (task['title'] == 'Quiz Review 01') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QuizScreen(quizTitle: task['title']),
                    ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            typeLabel,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: task['completed']
                                ? Colors.green
                                : Colors.grey[300],
                          ),
                          child: task['completed']
                              ? Icon(Icons.check, size: 16, color: Colors.white)
                              : Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(iconPath, width: 24, height: 24),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            task['title'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tenggat Waktu : ${task['deadline']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
