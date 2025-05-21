import 'package:flutter/material.dart';
import '../quiz_data.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  List<int> favoriteIndexes = [];

  void _answerQuestion(String selectedAnswer) {
    if (_questionIndex < questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/result');
    }
  }

  void _toggleFavorite() {
    if (!favoriteIndexes.contains(_questionIndex)) {
      favoriteIndexes.add(_questionIndex);
    } else {
      favoriteIndexes.remove(_questionIndex);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_questionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('퀴즈')),
      body: Column(
        children: [
          Text(currentQuestion['question'] as String),
          ...(currentQuestion['answers'] as List<String>).map((answer) {
            return ElevatedButton(
              onPressed: () => _answerQuestion(answer),
              child: Text(answer),
            );
          }).toList(),
          IconButton(
            icon: Icon(
              favoriteIndexes.contains(_questionIndex) ? Icons.star : Icons.star_border,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
