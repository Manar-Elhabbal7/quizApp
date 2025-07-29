import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:quiz/models/resultScreen.dart';
import 'home.dart';
import 'QuestionScreen.dart' show Questions;
import 'data/quesData.dart';


final Alignment start = Alignment.topLeft;
final Alignment end = Alignment.bottomRight;

List<Color> gradientColors = [Color(0xFF0C0F1F),Color(0xFF1A2238),Color(0xFF2C365A)];
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  //to store user's answers
  List<String> selectedAnswers = [];
  late Widget screen =  Home(switchScreen);
  void switchScreen(){
      setState(() {
        screen =  Questions(chooseAnswer);
      });
  }

  void restartQuiz() {
  setState(() {
    selectedAnswers.clear();
    screen = Home(switchScreen);
  });
}

  void chooseAnswer(String answer){
      selectedAnswers.add(answer);
      //solve problem of out of bounds
      if(selectedAnswers.length == questions.length){
        
        setState(() {
          //was give error because reset
          screen =  Result(List.from(selectedAnswers),this.restartQuiz);
          selectedAnswers.clear();
        });
        
      }
      
      log(selectedAnswers.toString());
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home :Scaffold(
          body : Container(
              decoration : BoxDecoration(
              gradient :LinearGradient(
                begin : start,
                end : end,
                colors: gradientColors
            ),
            ),
            child:  screen,
          ),
        ),
    );
  }
}
