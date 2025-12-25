import 'package:flutter/material.dart';

class Materi extends StatelessWidget {
  const Materi({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> meetings = [
      {
        'title': '01 - Pengantar User Interface Design',
        'details': '3 URLs, 2 Files, 3 Interactive Content',
        'completed': false,
      },
      {
        'title': '02 - Konsep User Interface Design',
        'details': '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        'completed': true,
      },
      // Add more meetings as needed
    ];

    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 40),
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          final meeting = meetings[index];
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            elevation: 0,
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
                          'Pertemuan ${index + 1}',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: meeting['completed']
                              ? Colors.green
                              : Colors.grey[300],
                        ),
                        child: meeting['completed']
                            ? Icon(Icons.check, size: 16, color: Colors.white)
                            : Icon(Icons.check, size: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    meeting['title'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    meeting['details'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
