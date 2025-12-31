import 'package:flutter/material.dart';

class QuizQuestionReviewScreen extends StatefulWidget {
  final String quizTitle;
  final int questionNumber;
  final String questionText;
  final List<String> options;
  final int? selectedAnswer;

  const QuizQuestionReviewScreen({
    super.key,
    required this.quizTitle,
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.selectedAnswer,
  });

  @override
  State<QuizQuestionReviewScreen> createState() =>
      _QuizQuestionReviewScreenState();
}

class _QuizQuestionReviewScreenState extends State<QuizQuestionReviewScreen> {
  final int totalQuestions = 15;

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Question Indicator Circles (same as quiz play screen)
              _buildQuestionIndicator(),
              const SizedBox(height: 24),

              // Question Number
              Text(
                'Soal Nomor ${widget.questionNumber} / $totalQuestions',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              // Question Content
              Text(
                widget.questionText,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 24),

              // Answer Options (same design as quiz play screen)
              _buildAnswerOptions(),
              const SizedBox(height: 32),

              // Back button to return to review
              _buildBackButton(),
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
            bool isCurrent = widget.questionNumber == questionNumber;

            return Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
                color: isCurrent ? const Color(0xFFB84A4A) : Colors.white,
              ),
              child: Center(
                child: Text(
                  '$questionNumber',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isCurrent ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        // Second row: 11-15
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(5, (index) {
            int questionNumber = index + 11;
            bool isCurrent = widget.questionNumber == questionNumber;

            return Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 1),
                color: isCurrent ? const Color(0xFFB84A4A) : Colors.white,
              ),
              child: Center(
                child: Text(
                  '$questionNumber',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: isCurrent ? Colors.white : Colors.black87,
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
    return Column(
      children: List.generate(widget.options.length, (index) {
        String optionLabel = String.fromCharCode(65 + index); // A, B, C, D, E
        bool isSelected = widget.selectedAnswer == index;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFB84A4A)
                : const Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$optionLabel. ${widget.options[index]}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBackButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Kembali',
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
