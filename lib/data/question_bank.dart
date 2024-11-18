import 'package:flutter/material.dart';
import 'package:quizit/pages/endPage.dart';
import 'questions.dart';
class Question_Bank{
  int item = 0;
  List<Question> question = [

    Question('You can lead a cow down stairs but not up stairs.', false, 0),
    Question('Approximately one quarter of human bones are in the feet.', true, 1),
    Question('A slug\'s blood is green.', true, 2),
    Question('Si Johann ba ay isang bai?', true, 3),

  ];

  List<Icon> scorekeeper = [
  ];
    int getCounter(){
      return question[item].counter;
    }

    String getQuestion(){
      return question[item].questions;
    }
    bool getAnswer(){
      return question[item].answers;
    }


    void nextItem(){
      item++;
      if (item == 4){
        item = item - 4;
      }
    }






}