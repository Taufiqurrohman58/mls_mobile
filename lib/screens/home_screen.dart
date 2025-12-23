import 'package:flutter/material.dart';

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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
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
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: const Center(
                child: Text(
                  'Welcome to Home Screen',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
