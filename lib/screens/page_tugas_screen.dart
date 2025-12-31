import 'package:flutter/material.dart';
import '../widgets/upload_file_sheet.dart';

class PageTugasScreen extends StatelessWidget {
  final String title;

  const PageTugasScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: const Color(0xFFB84A4A),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildAssignmentContent(),
            const SizedBox(height: 16),
            _buildAssignmentStatus(),
            const SizedBox(height: 50),
            _buildAddTaskButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildAssignmentContent() {
    final List<String> instructions = [
      '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.',
      '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dibuka sampai ditutup kembali, serta desain untuk tampilan-tampilan fungsi yang mendukung permainan seperti pop-up, alert, chat, dan lain-lain.',
      '3. Desain bisa dibuat menggunakan aplikasi khusus desain atau secara manual dengan tetap menjunjung kerapihan dan kejelasan setiap elemen dalam desain.',
      '4. Berikan identitas aplikasi game yang dibuat, seperti Nama Game, Genre, dan Platform. Serta berikan penjelasan pada setiap elemen pada desain, seperti gambar, teks, tombol, icon, dan lain-lain.',
      '5. File dikumpulkan dalam format .PDF dengan size maksimal 5MB.',
      '6. Tugas dikumpulkan paling lambat hari Jum\'at, 26 Februari 2021 jam 23:59 WIB (akan tertutup otomatis) dan akan dipresentasikan pada pertemuan selanjutnya via Zoom Meeting.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: instructions.map((instruction) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            instruction,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAssignmentStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Status Tugas dengan background merah dan width full
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFFB84A4A),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: const Text(
            'Status Tugas',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Detail Status Section
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Status Info dengan layout kiri-kanan
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Status
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatusRow(
                          'Status',
                          'Sudah Mengirim untuk di nilai',
                          Colors.grey[300]!,
                        ),
                        _buildStatusRow(
                          'Status Nilai',
                          'Belum Dinilai',
                          Colors.white,
                        ),
                        _buildStatusRow(
                          'Batas Tanggal',
                          '26 Februari 2021 23:59 WIB',
                          Colors.grey[300]!,
                        ),
                        _buildStatusRow(
                          'Sisa Waktu',
                          '0 Hari 0 Jam 0 Menit',
                          Colors.white,
                        ),
                        _buildStatusRow(
                          'File Tugas',
                          'UID_Android_Mobile_Game.pdf',
                          Colors.grey[300]!,
                          iconPath: 'assets/images/ic_interactive_content.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusRow(
    String label,
    String value,
    Color backgroundColor, {
    String? iconPath,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(color: backgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (iconPath != null) ...[
            Image.asset(iconPath, width: 16, height: 16, color: Colors.black54),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  void _showUploadFileBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const UploadFileSheet(),
    );
  }

  Widget _buildAddTaskButton() {
    return Builder(
      builder: (context) => Center(
        child: GestureDetector(
          onTap: () => _showUploadFileBottomSheet(context),
          child: Container(
            width: 155,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Tambahkan Tugas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
