import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Bullseye',
    home: GamePage(),
  ));
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello Bullseye',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            TextButton(
              child:
                  const Text('Hit me!', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                print('Hello');
              }
            )
          ],
        ),
      ),
    );
  }
}
