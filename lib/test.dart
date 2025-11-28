import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personality_app/models/question.dart';

import 'models/questions.dart';

class Test extends StatefulWidget {
  const Test(this.selectAnswer, {super.key});
  final void Function(String answer, int questionIndex) selectAnswer;

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int questionIndex = 0;
  
  void answerQuestion(answer){
    widget.selectAnswer(answer, questionIndex);
    setState(() {
      if(questionIndex+1<questions.length){questionIndex++;}
    });
  }

  @override
  Widget build(BuildContext context) {
    Question current = questions[questionIndex];
    int num = questionIndex+1;
    String text = current.text;
    final shuffledAnswers = current.answers.entries.toList()..shuffle();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Text(
              'Question $num: $text?',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(height: 10,),
          ...shuffledAnswers.map((e){
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () {answerQuestion(e.value);},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                    child: Text(
                      e.key,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}