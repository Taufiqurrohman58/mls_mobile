import 'package:flutter/material.dart';

class ClassItem extends StatelessWidget {
  final String title;
  final String date;

  const ClassItem({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tanggal Mulai $date',
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
