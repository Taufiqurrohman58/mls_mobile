import 'package:flutter/material.dart';
import 'dart:async';
import 'quiz_question_review_screen.dart';

class QuizReviewScreen extends StatefulWidget {
  final String quizTitle;
  final List<int?> answeredQuestions;
  final int totalQuestions;
  final int startTimeInSeconds;
  final int endTimeInSeconds;

  const QuizReviewScreen({
    super.key,
    required this.quizTitle,
    required this.answeredQuestions,
    required this.totalQuestions,
    required this.startTimeInSeconds,
    required this.endTimeInSeconds,
  });

  @override
  State<QuizReviewScreen> createState() => _QuizReviewScreenState();
}

class _QuizReviewScreenState extends State<QuizReviewScreen> {
  // Sample questions data (same as in quiz_play_screen)
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Radio button dapat digunakan untuk menentukan ?',
      'options': [
        'Jenis Kelamin',
        'Alamat',
        'Hobby',
        'Riwayat pendidikan',
        'Umur',
      ],
    },
    {
      'question': 'Widget apa yang digunakan untuk input teks dalam Flutter?',
      'options': ['TextField', 'Button', 'Image', 'Container', 'Row'],
    },
    {
      'question': 'Apa fungsi utama dari StatefulWidget?',
      'options': [
        'Untuk widget yang tidak berubah',
        'Untuk widget yang dapat berubah',
        'Untuk layout saja',
        'Untuk styling saja',
        'Untuk navigation saja',
      ],
    },
    {
      'question': 'Apa kepanjangan dari API dalam programming?',
      'options': [
        'Application Programming Interface',
        'Automated Program Integration',
        'Advanced Programming Instructions',
        'Application Process Integration',
        'Automated Protocol Interface',
      ],
    },
    {
      'question': 'Mana yang merupakan bahasa pemrograman berorientasi objek?',
      'options': ['Java', 'C', 'HTML', 'CSS', 'SQL'],
    },
    {
      'question': 'Apa fungsi dari fungsi main() dalam program C?',
      'options': [
        'Titik awal eksekusi program',
        'Fungsi untuk input data',
        'Fungsi untuk output data',
        'Fungsi untuk mendeklarasikan variabel',
        'Fungsi untuk mengakhiri program',
      ],
    },
    {
      'question': 'Dalam database, apa kepanjangan dari SQL?',
      'options': [
        'Structured Query Language',
        'Sequential Query Language',
        'Standard Query Logic',
        'Structured Question Language',
        'Sequential Question Logic',
      ],
    },
    {
      'question': 'Mana yang bukan merupakan tipe data primitif dalam Java?',
      'options': ['String', 'int', 'boolean', 'char', 'float'],
    },
    {
      'question': 'Apa fungsi dari break statement dalam perulangan?',
      'options': [
        'Menghentikan perulangan secara paksa',
        'Melanjutkan ke iterasi berikutnya',
        'Mengulang perulangan dari awal',
        'Menghentikan program',
        'Melompati satu iterasi',
      ],
    },
    {
      'question':
          'Dalam HTML, tag apa yang digunakan untuk membuat heading terbesar?',
      'options': ['<h1>', '<h6>', '<head>', '<header>', '<title>'],
    },
    {
      'question': 'Apa yang dimaksud dengan variabel dalam pemrograman?',
      'options': [
        'Tempat penyimpanan data yang dapat berubah',
        'Fungsi untuk menghitung',
        'Jenis loop dalam program',
        'Kondisi dalam percabangan',
        'Method untuk output',
      ],
    },
    {
      'question': 'Mana yang merupakan operator perbandingan dalam Python?',
      'options': ['==', '=', '===', '=<', '=>'],
    },
    {
      'question': 'Apa fungsi dari CSS dalam pengembangan web?',
      'options': [
        'Mengatur tampilan dan layout',
        'Mengatur struktur halaman',
        'Mengatur fungsionalitas',
        'Mengatur database',
        'Mengatur keamanan',
      ],
    },
    {
      'question':
          'Dalam Git, perintah apa yang digunakan untuk menyimpan perubahan?',
      'options': ['commit', 'push', 'pull', 'clone', 'branch'],
    },
    {
      'question': 'Apa kepanjangan dari HTTP?',
      'options': [
        'HyperText Transfer Protocol',
        'High Transfer Text Protocol',
        'Hyperlink Transfer Protocol',
        'HighText Transfer Program',
        'Hyper Transfer Text Process',
      ],
    },
  ];

  String get _formattedStartTime {
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(
      widget.startTimeInSeconds * 1000,
    );
    return '${_getDayName(startTime.weekday)} ${startTime.day} ${_getMonthName(startTime.month)} ${startTime.year} ${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
  }

  String get _formattedEndTime {
    DateTime endTime = DateTime.fromMillisecondsSinceEpoch(
      widget.endTimeInSeconds * 1000,
    );
    return '${_getDayName(endTime.weekday)} ${endTime.day} ${_getMonthName(endTime.month)} ${endTime.year} ${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}';
  }

  String get _completionTime {
    int duration = widget.endTimeInSeconds - widget.startTimeInSeconds;
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return '$minutes Menit $seconds Detik';
  }

  int get _score {
    int correctAnswers = 0;
    // For demo purposes, we'll assume all answers are wrong (score = 0)
    // In real app, you'd compare with correct answers
    return correctAnswers;
  }

  String _getDayName(int weekday) {
    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    return days[weekday - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Jawaban',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFFB84A4A),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary Container
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Started time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dimulai Pada',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          _formattedStartTime,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Status',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Selesai',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Selesai Pada',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          _formattedEndTime,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Waktu Penyelesaian',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          _completionTime,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nilai',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '$_score / 100',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Questions List
              Text(
                'Daftar Soal',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.totalQuestions,
                itemBuilder: (context, index) {
                  int questionNumber = index + 1;
                  int? selectedAnswer =
                      widget.answeredQuestions[questionNumber - 1];
                  String questionText = questions[index]['question'];
                  List<String> options = questions[index]['options'];
                  String selectedAnswerText = selectedAnswer != null
                      ? '${String.fromCharCode(65 + selectedAnswer)}. ${options[selectedAnswer]}'
                      : 'Belum dijawab';

                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question number and "Lihat Soal" link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pertanyaan $questionNumber',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizQuestionReviewScreen(
                                      quizTitle: widget.quizTitle,
                                      questionNumber: questionNumber,
                                      questionText: questionText,
                                      options: options,
                                      selectedAnswer: selectedAnswer,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Lihat Soal',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Question text with grey background
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            questionText,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        const Text(
                          'Jawaban Tersimpan',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        const SizedBox(height: 4),

                        // Selected answer
                        Text(
                          selectedAnswerText,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
