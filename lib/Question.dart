import 'package:flutter/material.dart';

class DhudhsagarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goa Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  // Define Goa-related questions and answers
  List<Question> _questions = [
    Question(
      questionText: "Which is the oldest church in Goa?",
      options: [
        "Basilica of Bom Jesus",
        "Se Cathedral",
        "Church of St. Cajetan",
        "Church of St. Augustine"
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "Which beach in Goa is known for its vibrant nightlife?",
      options: [
        "Calangute Beach",
        "Anjuna Beach",
        "Baga Beach",
        "Palolem Beach"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "Which famous waterfall is located in Goa?",
      options: [
        "Dudhsagar Falls",
        "Nanda Devi Falls",
        "Chitrakoot Falls",
        "Hogenakkal Falls"
      ],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "Which festival is most celebrated in Goa?",
      options: ["Carnival", "Diwali", "Christmas", "New Year's Eve"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "Which Goan beach is famous for its dolphins?",
      options: [
        "Candolim Beach",
        "Palolem Beach",
        "Vagator Beach",
        "Colva Beach"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
      "Which church is located in Old Goa and is a UNESCO World Heritage Site?",
      options: [
        "Se Cathedral",
        "Basilica of Bom Jesus",
        "Church of St. Cajetan",
        "Our Lady of the Immaculate Conception Church"
      ],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "What is the traditional Goan music genre?",
      options: ["Fado", "Bailinho", "Bhavageet", "Konkani"],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: "Which of the following is a popular Goan dish?",
      options: ["Vindaloo", "Biryani", "Pasta", "Sushi"],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: "Where is the Dudhsagar Waterfall located?",
      options: ["North Goa", "South Goa", "Central Goa", "Panjim"],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText:
      "Which is the famous fort in Goa located on the shores of the Arabian Sea?",
      options: [
        "Aguada Fort",
        "Chapora Fort",
        "Reis Magos Fort",
        "Mormugao Fort"
      ],
      correctAnswerIndex: 0,
    ),
  ];

  void _nextQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex].correctAnswerIndex) {
      _score++;
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Quiz Completed!"),
        content: Text("Your Score: $_score/${_questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _currentQuestionIndex = 0;
                _score = 0;
              });
              Navigator.of(ctx).pop();
            },
            child: const Text("Restart"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Goa Quiz'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 222, 192, 122), // Set the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...List.generate(currentQuestion.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ElevatedButton(
                  onPressed: () => _nextQuestion(index),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10), // Reduced padding for smaller buttons
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 25), // Smaller font size
                  ),
                  child: Text(currentQuestion.options[index]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}