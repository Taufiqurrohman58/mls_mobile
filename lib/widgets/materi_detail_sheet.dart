import 'package:flutter/material.dart';
import 'lampiran_materi.dart';
import 'tugas_kuis.dart';

class MateriDetailSheet extends StatefulWidget {
  final String title;
  final String description;
  final List<Map<String, dynamic>> materials;
  final List<Map<String, dynamic>> tasksAndQuizzes;

  const MateriDetailSheet({
    super.key,
    required this.title,
    required this.description,
    required this.materials,
    required this.tasksAndQuizzes,
  });

  @override
  State<MateriDetailSheet> createState() => _MateriDetailSheetState();
}

class _MateriDetailSheetState extends State<MateriDetailSheet> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Deskripsi',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(widget.description, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 40,
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab('Lampiran Materi', 0),
                _buildTab('Tugas dan Kuis', 1),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [
                LampiranMateri(materials: widget.materials),
                TugasKuis(tasksAndQuizzes: widget.tasksAndQuizzes),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 14, color: Colors.black)),
            if (isSelected)
              Container(
                width: 50,
                height: 2,
                color: const Color(0xFFB84A4A),
                margin: const EdgeInsets.only(top: 4),
              ),
          ],
        ),
      ),
    );
  }
}
