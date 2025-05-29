import 'package:flutter/material.dart';
import '../data/question_list.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  bool _showResult = false;
  bool _answered = false;
  int _selectedIndex = -1;

  void _answerQuestion(int selected) {
    if (_answered) return;
    setState(() {
      _answered = true;
      _selectedIndex = selected;
      if (selected == questions[_currentIndex].correctIndex) {
        _score++;
      }
    });
    Future.delayed(Duration(seconds: 1), _nextQuestion);
  }

  void _nextQuestion() {
    if (_currentIndex < questions.length - 1) {
      setState(() {
        _currentIndex++;
        _answered = false;
        _selectedIndex = -1;
      });
    } else {
      setState(() {
        _showResult = true;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _currentIndex = 0;
      _score = 0;
      _answered = false;
      _selectedIndex = -1;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return Scaffold(
        appBar: AppBar(title: Text('결과')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('점수: $_score / ${questions.length}', style: TextStyle(fontSize: 22)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetQuiz,
                child: Text('다시 풀기'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('홈으로'),
              ),
            ],
          ),
        ),
      );
    }

    Question q = questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text('문제 ${_currentIndex + 1}/${questions.length}')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(q.question, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ...q.options.asMap().entries.map((entry) {
              int idx = entry.key;
              String text = entry.value;
              Color? tileColor;
              if (_answered) {
                if (idx == q.correctIndex) {
                  tileColor = Colors.green[200];
                } else if (idx == _selectedIndex) {
                  tileColor = Colors.red[200];
                }
              }
              return Card(
                color: tileColor ?? Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Text(text),
                  onTap: () => _answerQuestion(idx),
                ),
              );
            }).toList(),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(q.isFavorite ? Icons.star : Icons.star_border, color: Colors.orange),
                  onPressed: () {
                    setState(() {
                      q.isFavorite = !q.isFavorite;
                    });
                  },
                ),
                Text('즐겨찾기'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}