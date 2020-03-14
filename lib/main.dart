import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';
import 'package:quiz/quiz.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  int _totalScore = 0;

  var _questions = [
    {
      'question': 'What\'s your favourite color?',
      'options': [
        {'text': 'Red', 'score': 20},
        {'text': 'Green', 'score': 10},
        {'text': 'Blue', 'score': 5}
      ]
    },
    {
      'question': 'What\'s your favourite animal?',
      'options': [
        {'text': 'Dog', 'score': 20},
        {'text': 'Cat', 'score': 10},
        {'text': 'Rabbit', 'score': 5}
      ]
    },
    {
      'question': 'What\'s your favourite sport?',
      'options': [
        {'text': 'Cricket', 'score': 20},
        {'text': 'Football', 'score': 10},
        {'text': 'Hockey', 'score': 5}
      ]
    }
  ];

  _answerQuestion(int score) {
    
    setState(() {
      _index++;
      _totalScore+=score;
    });

    if (_index < _questions.length) {
      print('We have more questions');
    }
  }

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple, accentColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _index < _questions.length
            ? Quiz(answerQuestion: _answerQuestion, questions: _questions, index: _index,)
            : Center(child: Text('Your Score is : ' + _totalScore.toString())),
      ),
    );
  }
}
