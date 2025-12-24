import 'package:flutter/material.dart';
import '../widgets/class_item.dart';

class ProfileClass extends StatelessWidget {
  const ProfileClass({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 55, bottom: 20, left: 20, right: 20),
      children: const [
        ClassItem(
          title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
        ClassItem(
          title: 'SISTEM OPERASI D4SM-44-02 [DDS]',
          date: 'Tanggal Mulai Monday, 8 February 2021',
        ),
      ],
    );
  }
}
