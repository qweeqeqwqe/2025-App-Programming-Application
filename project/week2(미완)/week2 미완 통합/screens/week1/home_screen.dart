
import 'package:flutter/material.dart';
import '../week2/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈 화면')),
      body: Center(
        child: ElevatedButton(
          child: const Text('퀴즈 시작'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuizScreen()),
            );
          },
        ),
      ),
    );
  }
}
