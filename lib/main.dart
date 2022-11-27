// ignore_for_file: always_specify_types, inference_failure_on_function_invocation

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Guess my number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int randomNumber = Random().nextInt(100);
  final TextEditingController nrController = TextEditingController();
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                "I'm thinking of a number between 1 and 100.",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "It's your turn to guess my number!",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Card(
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Try a number!',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: nrController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (int.parse(nrController.text) == randomNumber) {
                            setState(() {
                              message = 'You guessed ${nrController.text} You guessed right!';
                            });
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('You guessed it!'),
                                content: const Text('Congratulations!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        randomNumber = Random().nextInt(100);
                                        message = '';
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Try again'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  )
                                ],
                              ),
                            );
                          } else if (int.parse(nrController.text) > randomNumber) {
                            setState(() {
                              message = 'You guessed ${nrController.text} Try lower!';
                            });
                          } else if (int.parse(nrController.text) < randomNumber) {
                            setState(() {
                              message = 'You guessed ${nrController.text} Try higher!';
                            });
                          }
                        },
                        child: const Text('Guess'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
