import 'package:flutter/material.dart';
import 'dashboard_class_materi.dart';
import 'dashboard_class_tugas&quis.dart';

class DashboardClassScreen extends StatefulWidget {
  const DashboardClassScreen({super.key});

  @override
  State<DashboardClassScreen> createState() => _DashboardClassScreenState();
}

class _DashboardClassScreenState extends State<DashboardClassScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                color: const Color(0xFFB84A4A),
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 16,
                      right: 16, 
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: const [Materi(), TugasKuis()],
                ),
              ),
            ],
          ),
          Positioned(
            top: 100, // 120 - 20
            left: 40,
            right: 40,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedIndex = 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Materi',
                                  style: TextStyle(
                                    color: _selectedIndex == 0
                                        ? const Color(0xFFB84A4A)
                                        : Colors.grey,
                                    fontWeight: _selectedIndex == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  height: 2,
                                  width: 30,
                                  color: _selectedIndex == 0
                                      ? const Color(0xFFB84A4A)
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedIndex = 1),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tugas&Kuis',
                                  style: TextStyle(
                                    color: _selectedIndex == 1
                                        ? const Color(0xFFB84A4A)
                                        : Colors.grey,
                                    fontWeight: _selectedIndex == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  height: 2,
                                  width: 40,
                                  color: _selectedIndex == 1
                                      ? const Color(0xFFB84A4A)
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
