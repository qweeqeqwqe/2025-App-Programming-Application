import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool favoriteOnly = false;

  final List<int> firstGenPokemonIds = [1, 4, 7, 25, 39, 52, 133];

  void startQuiz(BuildContext context, String difficulty, bool favoriteOnly) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          difficulty: difficulty,
          favoriteOnly: favoriteOnly,
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case '쉬움':
        return Colors.greenAccent.shade400;
      case '보통':
        return Colors.orangeAccent;
      case '어려움':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }

  IconData _getDifficultyIcon(String difficulty) {
    switch (difficulty) {
      case '쉬움':
        return Icons.catching_pokemon;
      case '보통':
        return Icons.bolt;
      case '어려움':
        return Icons.whatshot;
      default:
        return Icons.help;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFF3E0), Color(0xFFFFCCBC)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Text(
                  'Pokémon Quiz',
                  style: GoogleFonts.vt323(
                    fontSize: 48,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: firstGenPokemonIds.map((pokeId) {
                      final imageUrl =
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokeId.png';
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 28,
                            child: Image.network(imageUrl, width: 48, height: 48),
                          ),
                          const SizedBox(height: 4),
                          Text('No.$pokeId', style: GoogleFonts.vt323(fontSize: 14)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                Text('난이도를 선택하세요', style: GoogleFonts.vt323(fontSize: 24)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('즐겨찾기만 보기', style: GoogleFonts.vt323(fontSize: 18)),
                    Switch(
                      value: favoriteOnly,
                      onChanged: (val) => setState(() => favoriteOnly = val),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ...['쉬움', '보통', '어려움'].map(
                      (difficulty) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton.icon(
                      icon: Icon(
                        _getDifficultyIcon(difficulty),
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: _getDifficultyColor(difficulty),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 5,
                      ),
                      onPressed: () => startQuiz(context, difficulty, favoriteOnly),
                      label: Text(
                        difficulty,
                        style: GoogleFonts.vt323(fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
