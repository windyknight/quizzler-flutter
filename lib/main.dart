import 'package:flutter/material.dart';
import "quiz_brain.dart";
import "package:rflutter_alert/rflutter_alert.dart";

QuizBrain brain = new QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreRecord = [];

  void checkForEnd() {
    if (brain.isFinished()) {
      Alert a = Alert(
        context: context,
        type: AlertType.info,
        title: "End of Quiz",
        desc: "You have reached the end of the quiz.",
        buttons: [
          DialogButton(
            child: Text("Reset this quiz"),
            onPressed: () {
              setState(() {
                scoreRecord = [];
                brain.reset();
              });
            },
          ),
        ],
      );
      a.show();
    }
  }

  void checkAnswer(bool ans) {
    if (ans == brain.getQuestionAns()) { //correct answer
      scoreRecord.add(Icon(Icons.check, color: Colors.green,));
    }
    else { //wrong answer
      scoreRecord.add(Icon(Icons.close, color: Colors.red,));
    }
    brain.nextQuestion();
    checkForEnd();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ), //question
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  checkAnswer(true);
                });
              },
            ),
          ),
        ), //true button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  checkAnswer(false);
                });
              },
            ),
          ),
        ), //false button
        Row(
          children: scoreRecord,
        ), //record
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
