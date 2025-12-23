import 'package:flutter/material.dart';

class ClassProgressItem extends StatelessWidget {
  final String imagePath;
  final String year;
  final String title;
  final String code;
  final double progress;

  const ClassProgressItem({
    super.key,
    required this.imagePath,
    required this.year,
    required this.title,
    required this.code,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 106,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    year,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    code,
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 10,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.centerRight,
                          widthFactor: progress,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5)
                              ),
                              boxShadow: [BoxShadow(color: Colors.redAccent)],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${(progress * 100).toInt()} % Selesai',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
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
