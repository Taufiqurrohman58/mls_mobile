import 'package:flutter/material.dart';

class DetailPengumumanScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String contentTitle;
  final String content;
  final String imagePath;

  const DetailPengumumanScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.contentTitle,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Detail Pengumuman',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Image.asset(
                  'assets/images/ic_person.png',
                  width: 25,
                  height: 25,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8),
                Text(subtitle, style: const TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),
            Image.asset(imagePath, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Center(
              child:Text(
                contentTitle,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Text(content, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
