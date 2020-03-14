import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

  var questions;
  var answerQuestion;
  var index;
  Quiz({this.questions, this.index, this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: <Widget>[
                  Question(questions.elementAt(index)['question']),
                  ...(questions.elementAt(index)['options'] as List<Map<String, Object>>)
                      .map((option) {
                    return Answer(
                      answerQuestion: () =>answerQuestion(option['score']),
                      answerText: option['text'],
                    );
                  }).toList(),
                ],
              );
  }
}