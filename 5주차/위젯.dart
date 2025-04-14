import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(color: Colors.red),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(color: Colors.blue),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(color: Colors.black),
                              ),
                              Expanded(
                                child: Container(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(color: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
