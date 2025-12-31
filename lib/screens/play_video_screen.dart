import 'package:flutter/material.dart';

class PlayVideoScreen extends StatelessWidget {
  final String title;

  const PlayVideoScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> videoList = [
      {'image': 'assets/images/video2.jpg', 'title': 'Interaction Design'},
      {
        'image': 'assets/images/video3.jpg',
        'title': 'Pengantar Desain Antarmuka Pengguna',
      },
      {
        'image': 'assets/images/video4.jpg',
        'title': '4 Teori Dasar Desain Antarmuka Pengguna',
      },
      {
        'image': 'assets/images/video5.jpg',
        'title': 'Tutorial Dasar Figma - UI/UX Design Software',
      },
    ];

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add 8px spacing from header
          const SizedBox(height: 8),

          // Main video image
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/video1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Video Lainnya section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Video Lainnya',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Video list
          Expanded(
            child: ListView.builder(

              itemCount: videoList.length,
              itemBuilder: (context, index) {
                final video = videoList[index];
                final bool isGreyBackground =
                    index % 2 == 0; // Alternate colors

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isGreyBackground ? Colors.grey[200] : Colors.white,
                  ),
                  child: Row(
                    children: [
                      // Video thumbnail
                      ClipRRect(
                        child: Image.asset(
                          video['image']!,
                          width: 110,
                          height: 85,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Video title
                      Expanded(
                        child: Text(
                          video['title']!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
