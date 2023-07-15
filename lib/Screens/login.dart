// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/quiz.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> ky = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Welcome to Quiz App !',
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: ky,
                child: TextFormField(
                    controller: name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can not be empty";
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: 'please Enter your name',
                        border: OutlineInputBorder())),
              ),
              ElevatedButton(
                  onPressed: (() {
                    if (ky.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: ((context) => Quiz(
                                user: name.text,
                              ))));
                    }
                  }),
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
