import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const PokemonQuizApp());

class PokemonQuizApp extends StatelessWidget {
  const PokemonQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE3350D),  // 포켓볼 빨강
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),  // 부드러운 크림색
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE3350D),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
