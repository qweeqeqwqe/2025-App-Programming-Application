
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _questions = [
    {
  'question': '피카츄의 타입은?',
  'answers': ['불꽃', '물', '전기', '풀'],
  'correct': '전기',
  },
  {
  'question': '꼬부기의 진화형은?',
  'answers': ['어니부기', '파이리', '피죤', '리자드'],
  'correct': '어니부기',
  },
  ];

  int _currentIndex = 0;
  int _score = 0;

  void _answerQuestion(int index) {
    if (index == _questions[_currentIndex]['correct']) {
      _score++;
    }
    setState(() {
      _currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex >= _questions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text('결과')),
        body: Center(child: Text('점수: \$_score / \${_questions.length}')),
      );
    }

    var question = _questions[_currentIndex];
    return Scaffold(
      appBar: AppBar(title: const Text('퀴즈')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question['question'] as String),
          ...(question['answers'] as List<String>).asMap().entries.map((entry) {
            int idx = entry.key;
            String text = entry.value;
            return ElevatedButton(
              onPressed: () => _answerQuestion(idx),
              child: Text(text),
            );
          }).toList(),
        ],
      ),
    );
  }
}
