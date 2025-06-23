import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

//flutter pub get     # 패키지 다운로드
//flutter run

void main() => runApp(const PokemonQuizApp());

class PokemonQuizApp extends StatelessWidget {
  const PokemonQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE3350D), // 포켓볼 빨강
        scaffoldBackgroundColor: const Color(0xFFFFF8E1), // 부드러운 크림색
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE3350D),
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.vt323TextTheme(
          Theme.of(context).textTheme,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.vt323(fontSize: 22),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
