import 'package:flutter/material.dart';
import 'package:quiz/models/answerButton.dart';
import 'data/quesData.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget {
  const Questions(this.selectedAnswer,{super.key});

  final void Function(String answer) selectedAnswer;
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int idx = 0;
  void answerQ(String answer){
    widget.selectedAnswer(answer);
    setState(() {
      idx++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cur = questions[idx];

    return SizedBox(
      width: double.infinity,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //Question
          Text(
            cur.txt,
            style: GoogleFonts.titilliumWeb(
              fontSize: 24, color: Colors.white ,
              fontWeight: FontWeight.bold,
              ),
            textAlign: TextAlign.center,
            
          ),

          const SizedBox(height: 40),

          //Answers
          //... to get the list and make it iterable
          ...cur.getShuffledAnswers().map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AnsButton(
                  ans: answer,
                  onPressed: () {
                    answerQ(answer);
                  },
                ),
              );
            }),
        ],
      ),
    );
  }
}
