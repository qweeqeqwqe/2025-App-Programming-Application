import 'package:flutter/material.dart';
import 'dart:async'; //

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '현재 시각',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _currentTime;

  @override
  void initState() {
    super.initState();
    _updateTime();  
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();  
    });
  }

  void _updateTime() {
    final String formattedTime = DateTime.now().toString().split('.')[0]; // 초단위까지 포함한 시간 문자열
    setState(() {
      _currentTime = formattedTime;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("현재 시각"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text(
          _currentTime,
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
