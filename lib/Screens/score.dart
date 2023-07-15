import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Score extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
final scorre;
  // ignore: prefer_typing_uninitialized_variables
  final length;
  final name;
  const Score(
    {super.key, 
    required this.scorre, 
    required this.length,
    required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Your Result'))),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dear $name, ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0),
              ),
              const SizedBox(height: 10,),
            CircularPercentIndicator(
                radius: 100.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 10.0,
                percent: scorre/length,
                center: Text(
                  "$scorre / $length",
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.red,
                progressColor: Colors.green,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Your Result : ',
                  style: TextStyle(fontSize: 20.0,)),
                  if (scorre >= 5)
                    const Text('success' , style: TextStyle(color:Colors.greenAccent,
                    fontSize: 20),)
                  else
                    const Text('fail' , style: TextStyle(color:Colors.redAccent,fontSize: 20),)
                ],
              )
          ],
        ),
      ),
    );
  }
}
