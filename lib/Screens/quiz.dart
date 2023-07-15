import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/Questions.dart';
import 'package:quiz_app/Screens/score.dart';

class Quiz extends StatefulWidget {
  final user;
  const Quiz({super.key , required this.user});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int score = 0;
  int indx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text('Quiz'))),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          child: Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  child: Text(
                    Questions.quesList[indx]['questionText'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...(Questions.quesList[indx]['answers'] as List).map((e) {
                  return InkWell(
                      onTap: (() {
                        setState(() {
                          if (indx < Questions.quesList.length - 1) {
                            indx++;
                          } else {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: ((context) => Score(
                                      scorre: score,
                                      length: Questions.quesList.length,
                                      name:widget.user,
                                    ))));
                          }
                        });
                        score += e['score'] as int;
                      }),
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.greenAccent
                        ),
                        child: Text(e['text'] as String)));
                })
              ],
            ),
          ),
        ));
  }
}
