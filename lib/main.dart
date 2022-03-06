import 'package:flutter/material.dart';
import 'package:quizzler/qestion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> scopKeeper = [];
  // List<String> questions = [
  //   'This is where the question text will go.',
  //   '1', '2', '3'
  // ];
  // List<bool> answers = [true, false, true, false];
  List<Question> questionList = [
    Question(
        questionText: 'This is where the question text will go.',
        questionAnswer: true),
    Question(questionText: '1', questionAnswer: false),
    Question(questionText: '2', questionAnswer: true),
    Question(questionText: '3', questionAnswer: false)
  ];
  int index = 0;
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionList[index].questionAnswer;
    setState(() {
      if (correctAnswer == userPickedAnswer) {
        scopKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scopKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (index < questionList.length - 1) {
        index++;
      } else {
        index = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  questionList[index].questionText,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  child: const Text('True'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () => checkAnswer(true),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    child: const Text("False",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () => checkAnswer(false)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: scopKeeper,
              ),
            )
          ],
        ),
      ),
    );
  }
}
