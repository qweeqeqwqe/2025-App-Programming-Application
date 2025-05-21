import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('퀴즈 홈')),
      body: Center(
        child: ElevatedButton(
          child: Text('퀴즈 시작'),
          onPressed: () {
            Navigator.pushNamed(context, '/quiz');
          },
        ),
      ),
    );
  }
}
