import '../models/question.dart';

final List<Question> questions = [
  Question(
    question: '피카츄의 타입은 무엇인가요?',
    options: ['불꽃', '물', '전기', '풀'],
    correctIndex: 2,
    explanation: '피카츄는 전기 타입 포켓몬입니다.',
  ),
  Question(
    question: '이상해씨의 진화형은?',
    options: ['이상해꽃', '이상해풀', '이상해잎', '이상해덩굴'],
    correctIndex: 0,
    explanation: '이상해씨 → 이상해풀 → 이상해꽃 순으로 진화합니다.',
  ),
];