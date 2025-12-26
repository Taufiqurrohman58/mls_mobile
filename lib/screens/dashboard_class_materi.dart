import 'package:flutter/material.dart';
import '../widgets/materi_detail_sheet.dart';

class Materi extends StatelessWidget {
  const Materi({super.key});

  void _showMateriDetailSheet(
    BuildContext context,
    String title,
    String description,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) =>
          MateriDetailSheet(title: title, description: description),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> meetings = [
      {
        'title': '01 - Pengantar User Interface Design',
        'details': '3 URLs, 2 Files, 3 Interactive Content',
        'description':
            'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience',
        'completed': false,
      },
      {
        'title': '02 - Konsep User Interface Design',
        'details': '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        'description':
            'Konsep User Interface Design melibatkan pemahaman mendalam tentang elemen-elemen dasar yang membentuk pengalaman pengguna. Dari layout hingga navigasi, setiap aspek dirancang untuk memastikan interaksi yang intuitif dan efisien. Materi ini akan membahas berbagai teori dan praktik terbaik dalam bidang UI Design.',
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
            child: InkWell(
              onTap: () => _showMateriDetailSheet(
                context,
                meeting['title'],
                meeting['description'],
              ),
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
                              : Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      meeting['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      meeting['details'],
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
