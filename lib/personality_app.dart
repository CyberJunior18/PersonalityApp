import 'package:flutter/material.dart';
import 'package:personality_app/data/questions.dart';
import 'package:personality_app/results.dart';

import 'home.dart';
import 'test.dart';

class PersonalityApp extends StatefulWidget {
  const PersonalityApp({super.key});

  @override
  State<PersonalityApp> createState() => _PersonalityAppState();
}

class _PersonalityAppState extends State<PersonalityApp> {
  Widget? activeScreen;
  Map<String, int> results = {};

  void selectAnswer(String answer, int questionIndex) {
    results[answer] = (results[answer] ?? 0) + 1;
    if(questionIndex == questions.length - 1){
      setState(() {
        activeScreen = Results(results: results, restart: restart,);
      });
    }
  }

  void restart(){
    setState(() {
      results = {};
      activeScreen = Home(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = Test(selectAnswer);
    });
  }

  @override
  void initState() {
    activeScreen = Home(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: activeScreen);
  }
}
