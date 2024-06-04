// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController input01controller = TextEditingController();
  TextEditingController input02controller = TextEditingController();

  int answer = 0;
  String operator = '';

  void setOperator(String op) {
    setState(() {
      operator = op;
    });
  }

  void output() {
    int number01 = int.parse(input01controller.text);
    int number02 = int.parse(input02controller.text);

    setState(() {
      switch (operator) {
        case '+':
          answer = number01 + number02;
          break;
        case '-':
          answer = number01 - number02;
          break;
        case '*':
          answer = number01 * number02;
          break;
        case '/':
          answer = number02 != 0 ? number01 ~/ number02 : 0; // Integer division
          break;
        default:
          answer = 0;
      }
      print(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              answer.toString(),
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: input01controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: 'Input 01',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: input02controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                labelText: 'Input 02',
              ),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () => setOperator('+'),
                  child: Text('+'),
                  color: Colors.amber,
                ),
                MaterialButton(
                  onPressed: () => setOperator('-'),
                  child: Text('-'),
                  color: Colors.amber,
                ),
                MaterialButton(
                  onPressed: () => setOperator('*'),
                  child: Text('*'),
                  color: Colors.amber,
                ),
                MaterialButton(
                  onPressed: () => setOperator('/'),
                  child: Text('/'),
                  color: Colors.amber,
                ),
              ],
            ),
            MaterialButton(
              onPressed: output,
              color: Colors.amber,
              child: const Text('Answer'),
            ),
          ],
        ),
      ),
    );
  }
}