import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color.fromARGB(0, 74, 73, 73),
      ),
      home: QuizHome(),
    );
  }
}

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int currentQuestionIndex = 0;
  int score = 0;

  List<Map<String, Object>> questions = [
    {
      'question': 'What is the capital of India?',
      'options': ['Mumbai', 'Delhi', 'Chennai', 'Kolkata'],
      'answer': 'Delhi'
    },
    {
      'question': 'Flutter is developed by?',
      'options': ['Facebook', 'Google', 'Microsoft', 'Apple'],
      'answer': 'Google'
    },
    {
      'question': 'Which language is used by Flutter?',
      'options': ['Java', 'Swift', 'Kotlin', 'Dart'],
      'answer': 'Dart'
    },
    {
      'question': 'Which is the largest mammal?',
      'options': ['Elephant', 'Blue Whale', 'Shark', 'Giraffe'],
      'answer': 'Blue Whale'
    },
    {
      'question': 'What is the boiling point of water?',
      'options': ['100°C', '90°C', '80°C', '120°C'],
      'answer': '100°C'
    },
    {
      'question': 'Who wrote "Romeo and Juliet"?',
      'options': ['Charles Dickens', 'Mark Twain', 'William Shakespeare', 'Jane Austen'],
      'answer': 'William Shakespeare'
    },
    {
      'question': 'What is the chemical symbol for gold?',
      'options': ['Au', 'Ag', 'Pb', 'Fe'],
      'answer': 'Au'
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'answer': 'Mars'
    },
    {
      'question': 'What is the largest ocean on Earth?',
      'options': ['Atlantic Ocean', 'Indian Ocean', 'Arctic Ocean', 'Pacific Ocean'],
      'answer': 'Pacific Ocean'
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'options': ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
      'answer': 'Leonardo da Vinci'
    },
    {
      'question': 'What is the hardest natural substance on Earth?',
      'options': ['Gold', 'Iron', 'Diamond', 'Quartz'],
      'answer': 'Diamond'
    },
    {
      'question': 'Which gas do plants absorb from the atmosphere?',
      'options': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
      'answer': 'Carbon Dioxide'
    },
    {
      'question': 'What is the main ingredient in guacamole?',
      'options': ['Tomato', 'Avocado', 'Pepper', 'Onion'],
      'answer': 'Avocado'
    },
    {
      'question': 'What is the largest continent?',
      'options': ['Africa', 'Asia', 'Europe', 'North America'],
      'answer': 'Asia'
    },
    {
      'question': 'Who discovered penicillin?',
      'options': ['Marie Curie', 'Alexander Fleming', 'Louis Pasteur', 'Albert Einstein'],
      'answer': 'Alexander Fleming'
    },
    {
      'question': 'What is the capital of France?',
      'options': ['Berlin', 'Madrid', 'Paris', 'Rome'],
      'answer': 'Paris'
    },
    {
      'question': 'Which element has the atomic number 1?',
      'options': ['Oxygen', 'Hydrogen', 'Helium', 'Carbon'],
      'answer': 'Hydrogen'
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'options': ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      'answer': 'Jupiter'
    },
    {
      'question': 'Who wrote "To Kill a Mockingbird"?',
      'options': ['Harper Lee', 'F. Scott Fitzgerald', 'Ernest Hemingway', 'Mark Twain'],
      'answer': 'Harper Lee'
    },
    {
      'question': 'What is the main language spoken in Brazil?',
      'options': ['Spanish', 'Portuguese', 'English', 'French'],
      'answer': 'Portuguese'
    },
    {
      'question': 'What is the smallest country in the world?',
      'options': ['Monaco', 'Vatican City', 'San Marino', 'Liechtenstein'],
      'answer': 'Vatican City'
    },
    {
      'question': 'What is the currency of Japan?',
      'options': ['Yen', 'Won', 'Dollar', 'Euro'],
      'answer': 'Yen'
    },
    {
      'question': 'What is the main ingredient in sushi?',
      'options': ['Rice', 'Fish', 'Seaweed', 'Vegetables'],
      'answer': 'Rice'
    },
    {
      'question': 'Who was the first person to walk on the moon?',
      'options': ['Yuri Gagarin', 'Neil Armstrong', 'Buzz Aldrin', 'John Glenn'],
      'answer': 'Neil Armstrong'
    },
    {
      'question': 'What is the largest desert in the world?',
      'options': ['Sahara Desert', 'Arabian Desert', 'Gobi Desert', 'Kalahari Desert'],
      'answer': 'Sahara Desert'
    },
  ];

  void checkAnswer(String selectedOption) {
    if (selectedOption == questions[currentQuestionIndex]['answer']) {
      score++;
    }
    setState(() {
      currentQuestionIndex++;
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 255, 111, 224), Color.fromARGB(255, 253, 255, 122)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: currentQuestionIndex < questions.length
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                    LinearProgressIndicator(
                      value: (currentQuestionIndex + 1) / questions.length,
                      backgroundColor: Colors.white24,
                      color: Colors.amber,
                      minHeight: 8,
                    ),
                    SizedBox(height: 30),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: Card(
                        key: ValueKey(currentQuestionIndex),
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            questions[currentQuestionIndex]['question'] as String,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ...(questions[currentQuestionIndex]['options']
                            as List<String>)
                        .map((option) => InkWell(
                              onTap: () => checkAnswer(option),
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(2, 2),
                                    )
                                  ],
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ))
                        .toList(),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text(
                        'Quiz Complete!',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Your Score: $score / ${questions.length}',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: resetQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Text("Restart Quiz",
                            style: TextStyle(fontSize: 18)),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
