import 'package:flutter/material.dart';
import 'dart:async';

class QuizPlayScreen extends StatefulWidget {
  final String quizTitle;

  const QuizPlayScreen({super.key, required this.quizTitle});

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  int currentQuestion = 1;
  final int totalQuestions = 15;
  int? selectedAnswer;
  List<int?> answeredQuestions = List.filled(15, null);

  // Timer variables
  int remainingSeconds = 15 * 60; 
  Timer? _timer;
  String get formattedTime => _formatTime(remainingSeconds);

  // Sample questions data
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

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
          _handleTimeUp();
        }
      });
    });
  }

  void _handleTimeUp() {
    // Handle quiz time up - you can show dialog or navigate back
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Waktu Habis'),
        content: const Text(
          'Waktu quiz telah habis. Jawaban Anda akan disubmit.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSecs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSecs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.quizTitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: const Color(0xFFB84A4A),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.access_time, color: Colors.white, size: 16),
                const SizedBox(width: 4),
                Text(
                  formattedTime,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question Indicator Circles
              _buildQuestionIndicator(),
              const SizedBox(height: 24),

              // Question Number
              Text(
                'Soal Nomor $currentQuestion / $totalQuestions',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 70),

              Text(
                questions[currentQuestion - 1]['question'],
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 70),

              _buildAnswerOptions(),
              const SizedBox(height: 32),

              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionIndicator() {
    return Column(
      children: [
        // First row: 1-10
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(10, (index) {
            int questionNumber = index + 1;
            bool isAnswered = answeredQuestions[questionNumber - 1] != null;
            bool isCurrent = currentQuestion == questionNumber;

            bool shouldBeGreen = false;
            if (currentQuestion == 2 && questionNumber == 1) {
              shouldBeGreen = true; 
            } else if (currentQuestion == 3 && questionNumber == 2) {
              shouldBeGreen =
                  true;
            } else if (isAnswered) {
              shouldBeGreen = true; 
            }

            return Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
                color: shouldBeGreen ? Colors.green : Colors.white,
              ),
              child: Center(
                child: Text(
                  '$questionNumber',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: shouldBeGreen ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(5, (index) {
            int questionNumber = index + 11;
            bool isAnswered = answeredQuestions[questionNumber - 1] != null;
            bool isCurrent = currentQuestion == questionNumber;

            return Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
                color: isAnswered ? Colors.green : Colors.white,
              ),
              child: Center(
                child: Text(
                  '$questionNumber',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isAnswered ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAnswerOptions() {
    List<String> options = questions[currentQuestion - 1]['options'];

    return Column(
      children: List.generate(options.length, (index) {
        String optionLabel = String.fromCharCode(65 + index); // A, B, C, D, E
        bool isSelected = selectedAnswer == index;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedAnswer = index;
              answeredQuestions[currentQuestion - 1] = index;
            });
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFB84A4A) : const Color.fromARGB(255, 236, 236, 236),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '$optionLabel. ${options[index]}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons() {
    if (currentQuestion == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (currentQuestion < totalQuestions) {
                setState(() {
                  currentQuestion++;
                  selectedAnswer = answeredQuestions[currentQuestion - 1];
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Soal Selanjutnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    } else if (currentQuestion == totalQuestions) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (currentQuestion > 1) {
                setState(() {
                  currentQuestion--;
                  selectedAnswer = answeredQuestions[currentQuestion - 1];
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Soal Sebelumnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle quiz completion
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Selesai',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (currentQuestion > 1) {
                setState(() {
                  currentQuestion--;
                  selectedAnswer = answeredQuestions[currentQuestion - 1];
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Soal Sebelumnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentQuestion < totalQuestions) {
                setState(() {
                  currentQuestion++;
                  selectedAnswer = answeredQuestions[currentQuestion - 1];
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Soal Selanjutnya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
