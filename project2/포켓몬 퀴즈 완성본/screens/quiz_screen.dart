import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/questions.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String difficulty;
  final bool favoriteOnly;
  final List<Map<String, dynamic>>? questionsForReview;

  const QuizScreen({
    super.key,
    required this.difficulty,
    required this.favoriteOnly,
    this.questionsForReview,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Map<String, dynamic>> filteredQuestions;
  int currentIndex = 0;
  int score = 0;
  bool answered = false;
  bool lastAnswerCorrect = false;

  List<int> wrongQuestionIndexes = [];

  Timer? timer;
  int timeLeft = 0;

  @override
  void initState() {
    super.initState();

    if (widget.questionsForReview != null) {
      filteredQuestions = List<Map<String, dynamic>>.from(widget.questionsForReview!);
    } else {
      filteredQuestions = questions.where((q) {
        if (widget.favoriteOnly && q['isFavorite'] != true) return false;
        return q['difficulty'] == widget.difficulty;
      }).toList();

      filteredQuestions.shuffle();
    }

    startTimer();
  }

  void startTimer() {
    switch (widget.difficulty) {
      case '쉬움':
        timeLeft = 15;
        break;
      case '보통':
        timeLeft = 10;
        break;
      case '어려움':
        timeLeft = 7;
        break;
      default:
        timeLeft = 10;
    }

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        t.cancel();
        if (!answered) {
          _answerQuestion(false);
          Future.delayed(const Duration(seconds: 2), _nextQuestion);
        }
      }
    });
  }

  void _answerQuestion(bool isCorrect) {
    if (answered) return;
    timer?.cancel();
    setState(() {
      answered = true;
      lastAnswerCorrect = isCorrect;
      if (isCorrect) {
        score++;
      } else {
        if (!wrongQuestionIndexes.contains(currentIndex)) {
          wrongQuestionIndexes.add(currentIndex);
        }
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      filteredQuestions[currentIndex]['isFavorite'] =
      !(filteredQuestions[currentIndex]['isFavorite'] ?? false);
    });
  }

  void _nextQuestion() {
    setState(() {
      answered = false;
      lastAnswerCorrect = false;
      if (currentIndex < filteredQuestions.length - 1) {
        currentIndex++;
        startTimer();
      } else {
        final wrongQuestions =
        wrongQuestionIndexes.map((i) => filteredQuestions[i]).toList();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: score,
              total: filteredQuestions.length,
              wrongQuestions: wrongQuestions,
              difficulty: widget.difficulty,
              favoriteOnly: widget.favoriteOnly,
            ),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (filteredQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('퀴즈', style: GoogleFonts.vt323(fontSize: 20))),
        body: Center(
          child: Text(
            '조건에 맞는 문제가 없습니다.',
            style: GoogleFonts.vt323(fontSize: 18),
          ),
        ),
      );
    }

    final question = filteredQuestions[currentIndex];
    bool isFav = question['isFavorite'] ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '문제 ${currentIndex + 1} / ${filteredQuestions.length}',
          style: GoogleFonts.vt323(fontSize: 20),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(isFav ? Icons.star : Icons.star_border),
            color: Colors.yellow[600],
            onPressed: _toggleFavorite,
            tooltip: isFav ? '즐겨찾기 해제' : '즐겨찾기 추가',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (currentIndex + 1) / filteredQuestions.length,
                backgroundColor: Colors.grey[300],
                color: Colors.deepPurple,
                minHeight: 8,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '남은 시간: $timeLeft초',
                    style: GoogleFonts.vt323(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              if (question['imageUrl'] != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Image.network(
                    question['imageUrl'],
                    height: 150,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        Text('이미지를 불러올 수 없습니다',
                            style: GoogleFonts.vt323(fontSize: 14)),
                  ),
                ),
              Text(
                question['question'],
                style: GoogleFonts.vt323(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...List.generate(question['answers'].length, (index) {
                final answer = question['answers'][index];
                Color? buttonColor;

                if (answered) {
                  if (answer['isCorrect'] == true) {
                    buttonColor = Colors.green[400];
                  } else if (!lastAnswerCorrect &&
                      answer == question['answers'][index]) {
                    buttonColor = Colors.red[400];
                  }
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: answered
                        ? null
                        : () => _answerQuestion(answer['isCorrect']),
                    child: Text(
                      answer['text'],
                      style: GoogleFonts.vt323(fontSize: 18),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),
              if (answered) ...[
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: Text(
                    lastAnswerCorrect ? '정답입니다!' : '틀렸습니다!',
                    key: ValueKey(lastAnswerCorrect),
                    style: GoogleFonts.vt323(
                      fontSize: 18,
                      color:
                      lastAnswerCorrect ? Colors.green[700] : Colors.red[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '해설: ${question['explanation']}',
                  style: GoogleFonts.vt323(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: _nextQuestion,
                  icon: const Icon(Icons.navigate_next),
                  label: Text('다음 문제', style: GoogleFonts.vt323(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
