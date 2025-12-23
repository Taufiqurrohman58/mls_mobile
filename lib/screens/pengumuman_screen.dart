import 'package:flutter/material.dart';
import '../widgets/announcement_item.dart';

class PengumumanScreen extends StatelessWidget {
  const PengumumanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Pengumuman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: const [
          AnnouncementItem(
            imagePath: 'assets/images/ic_speaker.png',
            title: 'Maintenance Pra UAS Semester Genap 2020/2021',
            subtitle: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
          ),
          AnnouncementItem(
            imagePath: 'assets/images/ic_speaker.png',
            title: 'Update Sistem LMS Mobile',
            subtitle: 'By Admin Celoe - Kamis, 3 Juni 2021, 14:30',
          ),
          AnnouncementItem(
            imagePath: 'assets/images/ic_speaker.png',
            title: 'Pengumuman Libur Nasional',
            subtitle: 'By Admin Celoe - Jumat, 4 Juni 2021, 09:00',
          ),
        ],
      ),
    );
  }
}
