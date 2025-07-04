final List<Map<String, dynamic>> questions = [
  // 쉬움 (5문제)
  {
    'question': '피카츄의 타입은 무엇일까요?',
    'answers': [
      {'text': '불꽃', 'isCorrect': false},
      {'text': '전기', 'isCorrect': true},
      {'text': '물', 'isCorrect': false},
      {'text': '풀', 'isCorrect': false},
    ],
    'explanation': '피카츄는 전기 타입 포켓몬입니다.',
    'difficulty': '쉬움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png',
  },
  {
    'question': '꼬부기의 타입은 무엇인가요?',
    'answers': [
      {'text': '물', 'isCorrect': true},
      {'text': '불꽃', 'isCorrect': false},
      {'text': '풀', 'isCorrect': false},
      {'text': '비행', 'isCorrect': false},
    ],
    'explanation': '꼬부기는 물 타입입니다.',
    'difficulty': '쉬움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png',
  },
  {
    'question': '이상해씨는 어떤 포켓몬인가요?',
    'answers': [
      {'text': '풀/독 타입', 'isCorrect': true},
      {'text': '물 타입', 'isCorrect': false},
      {'text': '노말 타입', 'isCorrect': false},
      {'text': '강철 타입', 'isCorrect': false},
    ],
    'explanation': '이상해씨는 풀과 독 타입입니다.',
    'difficulty': '쉬움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
  },
  {
    'question': '가디는 어떤 타입인가요?',
    'answers': [
      {'text': '불꽃', 'isCorrect': true},
      {'text': '전기', 'isCorrect': false},
      {'text': '풀', 'isCorrect': false},
      {'text': '비행', 'isCorrect': false},
    ],
    'explanation': '가디는 불꽃 타입 포켓몬입니다.',
    'difficulty': '쉬움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/58.png',
  },
  {
    'question': '잠만보는 무엇을 잘하나요?',
    'answers': [
      {'text': '잠자기', 'isCorrect': true},
      {'text': '수영하기', 'isCorrect': false},
      {'text': '하늘 날기', 'isCorrect': false},
      {'text': '춤추기', 'isCorrect': false},
    ],
    'explanation': '잠만보는 거의 항상 자고 있는 포켓몬입니다.',
    'difficulty': '쉬움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png',
  },

  // 보통 (5문제)
  {
    'question': '리자몽은 어떤 타입인가요?',
    'answers': [
      {'text': '불꽃/비행', 'isCorrect': true},
      {'text': '불꽃/드래곤', 'isCorrect': false},
      {'text': '비행/드래곤', 'isCorrect': false},
      {'text': '노말/불꽃', 'isCorrect': false},
    ],
    'explanation': '리자몽은 불꽃과 비행 타입입니다.',
    'difficulty': '보통',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  },
  {
    'question': '이브이는 어떤 특징이 있나요?',
    'answers': [
      {'text': '여러 타입으로 진화 가능', 'isCorrect': true},
      {'text': '불꽃 타입만 진화 가능', 'isCorrect': false},
      {'text': '진화 불가', 'isCorrect': false},
      {'text': '노말 타입 유지', 'isCorrect': false},
    ],
    'explanation': '이브이는 다양한 타입으로 진화할 수 있는 포켓몬입니다.',
    'difficulty': '보통',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/133.png',
  },
  {
    'question': '고오스의 타입은 무엇인가요?',
    'answers': [
      {'text': '고스트/독', 'isCorrect': true},
      {'text': '고스트/악', 'isCorrect': false},
      {'text': '에스퍼/독', 'isCorrect': false},
      {'text': '악/독', 'isCorrect': false},
    ],
    'explanation': '고오스는 고스트와 독 타입을 가졌습니다.',
    'difficulty': '보통',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/92.png',
  },
  {
    'question': '뮤츠는 어떤 타입의 포켓몬인가요?',
    'answers': [
      {'text': '에스퍼', 'isCorrect': true},
      {'text': '고스트', 'isCorrect': false},
      {'text': '악', 'isCorrect': false},
      {'text': '격투', 'isCorrect': false},
    ],
    'explanation': '뮤츠는 전설의 에스퍼 타입 포켓몬입니다.',
    'difficulty': '보통',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png',
  },
  {
    'question': '디그다의 타입은?',
    'answers': [
      {'text': '땅', 'isCorrect': true},
      {'text': '바위', 'isCorrect': false},
      {'text': '강철', 'isCorrect': false},
      {'text': '노말', 'isCorrect': false},
    ],
    'explanation': '디그다는 땅 타입 포켓몬입니다.',
    'difficulty': '보통',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/50.png',
  },

  // 어려움 (5문제)
  {
    'question': '메가 리자몽 X는 어떤 타입인가요?',
    'answers': [
      {'text': '불꽃/드래곤', 'isCorrect': true},
      {'text': '불꽃/비행', 'isCorrect': false},
      {'text': '드래곤/비행', 'isCorrect': false},
      {'text': '노말/드래곤', 'isCorrect': false},
    ],
    'explanation': '메가 리자몽 X는 불꽃과 드래곤 타입입니다.',
    'difficulty': '어려움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png',
  },
  {
    'question': '뮤는 어떤 방식으로 얻을 수 있나요?',
    'answers': [
      {'text': '이벤트 또는 특전', 'isCorrect': true},
      {'text': '초기 마을에서 출현', 'isCorrect': false},
      {'text': '진화로 획득', 'isCorrect': false},
      {'text': '상점 구매', 'isCorrect': false},
    ],
    'explanation': '뮤는 일반적인 게임 플레이로는 얻기 어려우며 이벤트로 지급됩니다.',
    'difficulty': '어려움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/151.png',
  },
  {
    'question': '포켓몬 도감 번호 150번은 누구인가요?',
    'answers': [
      {'text': '뮤츠', 'isCorrect': true},
      {'text': '뮤', 'isCorrect': false},
      {'text': '리자몽', 'isCorrect': false},
      {'text': '이상해씨', 'isCorrect': false},
    ],
    'explanation': '뮤츠는 150번 도감 번호를 가진 전설의 포켓몬입니다.',
    'difficulty': '어려움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png',
  },
  {
    'question': '루기아는 어떤 타입 조합을 가졌나요?',
    'answers': [
      {'text': '에스퍼/비행', 'isCorrect': true},
      {'text': '물/비행', 'isCorrect': false},
      {'text': '비행/강철', 'isCorrect': false},
      {'text': '에스퍼/물', 'isCorrect': false},
    ],
    'explanation': '루기아는 에스퍼와 비행 타입입니다.',
    'difficulty': '어려움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/249.png',
  },
  {
    'question': '환상의 포켓몬이 아닌 것은?',
    'answers': [
      {'text': '뮤츠', 'isCorrect': true},
      {'text': '세레비', 'isCorrect': false},
      {'text': '지라치', 'isCorrect': false},
      {'text': '쉐이미', 'isCorrect': false},
    ],
    'explanation': '뮤츠는 전설의 포켓몬이지만 환상의 포켓몬은 아닙니다.',
    'difficulty': '어려움',
    'isFavorite': false,
    'imageUrl': 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/150.png',
  },
];
