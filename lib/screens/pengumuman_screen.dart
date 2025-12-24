import 'package:flutter/material.dart';
import '../widgets/announcement_item.dart';
import 'detail_pengumuman_screen.dart';

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
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPengumumanScreen(
                    title: 'Maintenance Pra UAS Semester Genap 2020/2021',
                    subtitle: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
                    contentTitle: 'Maintenance LMS',
                    content:
                        'Diinformasikan kepada seluruh pengguna LMS, kami dari tim CeLOE akan melakukan maintenance pada tanggal 12 Juni 2021, untuk meningkatkan layanan server dalam menghadapi ujian akhir semester (UAS).\n\nDengan adanya kegiatan maintenance tersebut maka\nsitus LMS (Ims.telkomuniversity.ac.id) tidak dapat diakses\nmulai pukul 00.00 s/d 06.00 WIB.\n\nDemikian informasi ini kami sampaikan, mohon maaf\natas ketidaknyamanannya.\n\nHormat Kami,\nCeLOE Telkom University',
                    imagePath: 'assets/images/gambar_pengumuman.png',
                  ),
                ),
              );
            },
            child: const AnnouncementItem(
              imagePath: 'assets/images/ic_speaker.png',
              title: 'Maintenance Pra UAS Semester Genap 2020/2021',
              subtitle: 'By Admin Celoe - Rabu, 2 Juni 2021, 10:45',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPengumumanScreen(
                    title: 'Update Sistem LMS Mobile',
                    subtitle: 'By Admin Celoe - Kamis, 3 Juni 2021, 14:30',
                    contentTitle: 'Update Sistem',
                    content:
                        'Informasi update sistem LMS Mobile telah tersedia.\n\nSilakan update aplikasi untuk fitur terbaru.',
                    imagePath: 'assets/images/no-image.png',
                  ),
                ),
              );
            },
            child: const AnnouncementItem(
              imagePath: 'assets/images/ic_speaker.png',
              title: 'Update Sistem LMS Mobile',
              subtitle: 'By Admin Celoe - Kamis, 3 Juni 2021, 14:30',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPengumumanScreen(
                    title: 'Pengumuman Libur Nasional',
                    subtitle: 'By Admin Celoe - Jumat, 4 Juni 2021, 09:00',
                    contentTitle: 'Libur Nasional',
                    content:
                        'Pengumuman libur nasional untuk hari raya.\n\nKampus akan tutup pada tanggal tersebut.',
                    imagePath: 'assets/images/no-image.png',
                  ),
                ),
              );
            },
            child: const AnnouncementItem(
              imagePath: 'assets/images/ic_speaker.png',
              title: 'Pengumuman Libur Nasional',
              subtitle: 'By Admin Celoe - Jumat, 4 Juni 2021, 09:00',
            ),
          ),
        ],
      ),
    );
  }
}
