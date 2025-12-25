import 'package:flutter/material.dart';
import '../widgets/class_progress_item.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[50],
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              ClassProgressItem(
                imagePath: 'assets/images/ui_ux.png',
                year: '2021/2',
                title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                code: 'D4SM-42-03 [ADY]',
                progress: 0.89,
                onTap: () => Navigator.pushNamed(context, '/dashboard_class'),
              ),
              const SizedBox(height: 16),
              ClassProgressItem(
                imagePath: 'assets/images/sistem_operasi.png',
                year: '2021/2',
                title: 'SISTEM OPERASI',
                code: 'D4SM-44-02 [DDS]',
                progress: 0.9,
                onTap: () => Navigator.pushNamed(context, '/dashboard_class'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
