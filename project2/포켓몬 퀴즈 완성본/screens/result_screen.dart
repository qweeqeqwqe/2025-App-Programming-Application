import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final List<Map<String, dynamic>> wrongQuestions;
  final String difficulty;
  final bool favoriteOnly;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    this.wrongQuestions = const [],
    required this.difficulty,
    required this.favoriteOnly,
  });

  @override
  Widget build(BuildContext context) {
    bool hasWrong = wrongQuestions.isNotEmpty;
    double percentage = (score / total) * 100;

    return Scaffold(
      appBar: AppBar(
        title: Text('퀴즈 결과', style: GoogleFonts.vt323(fontSize: 26)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Icon(Icons.emoji_events, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 16),
            Text(
              '당신의 점수는',
              style: GoogleFonts.vt323(fontSize: 24, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Text(
              '$score / $total',
              style: GoogleFonts.vt323(
                fontSize: 40,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '정답률: ${percentage.toStringAsFixed(1)}%',
              style: GoogleFonts.vt323(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.restart_alt),
              label: Text('퀴즈 다시 시작', style: GoogleFonts.vt323(fontSize: 18)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      difficulty: difficulty,
                      favoriteOnly: favoriteOnly,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            if (hasWrong)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.refresh),
                label: Text('오답 문제 복습', style: GoogleFonts.vt323(fontSize: 18)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        difficulty: difficulty,
                        favoriteOnly: favoriteOnly,
                        questionsForReview: wrongQuestions,
                      ),
                    ),
                  );
                },
              ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                side: const BorderSide(color: Colors.deepPurple),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.home, color: Colors.deepPurple),
              label: Text(
                '처음으로 돌아가기',
                style: GoogleFonts.vt323(fontSize: 18, color: Colors.deepPurple),
              ),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: const Icon(Icons.share),
              label: Text('점수 공유 (복사)', style: GoogleFonts.vt323(fontSize: 18)),
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(
                    text: '내 포켓몬 퀴즈 점수: $score / $total (정답률: ${percentage.toStringAsFixed(1)}%)',
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '점수가 클립보드에 복사되었습니다!',
                      style: GoogleFonts.vt323(fontSize: 16),
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            if (hasWrong)
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: wrongQuestions.map((q) {
                      final correct = q['answers'].firstWhere((a) => a['isCorrect'] == true)['text'];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '문제: ${q['question']}',
                              style: GoogleFonts.vt323(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text('정답: $correct', style: GoogleFonts.vt323(fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(
                              '해설: ${q['explanation']}',
                              style: GoogleFonts.vt323(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
