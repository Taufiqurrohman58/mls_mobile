import 'package:flutter/material.dart';
import '../widgets/class_progress_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 90,
            color: const Color(0xFFB84A4A),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 35),
                      child: const Text(
                        'Hallo,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'TAUFIQURROHMAN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 45),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 8,
                          top: 5,
                          bottom: 5,
                          right: 28,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFA04040).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Text(
                          'MAHASISWA',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB84A4A),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 20),
                      child: const Text(
                        'Tugas Yang Akan Datang',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFB21F1F),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Tugas 01 - UID Android Mobile Game',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: Column(
                              children: [
                                const Text(
                                  'Waktu Pengumpulan',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                                const Text(
                                  'Jumat 26 Februari, 23:59 WIB',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 20),
                      child: const Text(
                        'Pengumuman Terakhir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 8),
                      color: Colors.grey[300],
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Text(
                            'Maintenance Pra UAS Semester Genap 2020/2021',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Image.asset('assets/images/gambar_pengumuman.png'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16, left: 20),
                      child: const Text(
                        'Progres Kelas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF424242),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClassProgressItem(
                      imagePath: 'assets/images/ui_ux.png',
                      year: '2021/2',
                      title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                      code: 'D4SM-42-03 [ADY]',
                      progress: 0.9,
                    ),
                    const SizedBox(height: 16),
                    ClassProgressItem(
                      imagePath: 'assets/images/sistem_operasi.png',
                      year: '2021/2',
                      title: 'SISTEM OPERASI',
                      code: 'D4SM-44-02 [DDS]',
                      progress: 0.9,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
