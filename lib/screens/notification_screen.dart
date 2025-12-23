import 'package:flutter/material.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Notif',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          NotificationItem(
            imagePath: 'assets/images/notif1.png',
            title:
                'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
            time: '3 Hari 9 Jam Yang Lalu',
          ),
          NotificationItem(
            imagePath: 'assets/images/ic_quiz.png',
            title: 'Quiz baru tersedia untuk mata kuliah Sistem Operasi',
            time: '1 Hari 5 Jam Yang Lalu',
          ),
        ],
      ),
    );
  }
}
