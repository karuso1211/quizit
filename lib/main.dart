import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'data/question_bank.dart';
import 'package:restart_app/restart_app.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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

  List<Icon> scorekeeper = [
  ];

  int limiter = 0;
  int score = 1;
  Question_Bank qb = Question_Bank();
  Question_Bank limit = Question_Bank();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qb.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //True Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor:Colors.green),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if(qb.getCounter()==3){
                  alert();
                }
                checkAnswer(true);
                //The user picked true.
              },
            ),
          ),
        ),
        //False Button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if(qb.getCounter()==3){
                  alert();
                }
               checkAnswer(false);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }


  void  checkAnswer(bool A){
    setState(() {
      if (qb.getAnswer()==A){
        score++;
        scorekeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ));
      } else {
        scorekeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            )
        );
      }
      qb.nextItem();
    });

  }

  void alert(){

    String stringValue = score.toString();

    Alert(
      context: context,
      type: AlertType.info,
      title: "Done!",
      desc: "Your Score is:" + stringValue,
      buttons: [
        DialogButton(
          child: Text(
            "Reset",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Restart.restartApp(),
          width: 120,
        )
      ],
    ).show();

    }

}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
