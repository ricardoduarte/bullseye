import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'prompt.dart';
import 'control.dart';
import 'score.dart';
import 'game_model.dart';

void main() {
  runApp(const BullsEyeApp());
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return const MaterialApp(
      title: 'Bullseye',
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(_targetValue());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Prompt(targetValue: _model.target),
            Control(
              model: _model,
            ),
            TextButton(
                onPressed: () {
                  _showAlert(context);
                },
                child: const Text('Hit me!',
                    style: TextStyle(color: Colors.blue))),
            Score(
                totalScore: _model.totalScore,
                round: _model.round,
                onStartOver: _startNewGame),
          ],
        ),
      ),
    );
  }

  int _pointsForCurrentRound() {
    const int maximumScore = 100;
    int bonus = 0;
    int difference = _differenceAmount();

    if (difference == 0) {
      bonus = 100;
    } else if (difference == 1) {
      bonus = 50;
    }
    return maximumScore - difference + bonus;
  }

  String _alertTitle() {
    var difference = _differenceAmount();
    String title;

    if (difference == 0) {
      title = 'Perfect!';
    } else if (difference < 5) {
      title = 'You almost had it!';
    } else if (difference <= 10) {
      title = 'not bad.';
    } else {
      title = 'Are you even trying?';
    }
    return title;
  }

  int _differenceAmount() => (_model.current - _model.target).abs();

  int _targetValue() => Random().nextInt(100) + 1;

  void _startNewGame() {
    setState(() {
      _model.totalScore = GameModel.scoreStart;
      _model.round = GameModel.roundStart;
      _model.current = GameModel.sliderStart;
      _model.target = _targetValue();
    });
  }

  void _showAlert(BuildContext context) {
    var okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        setState(() {
          _model.totalScore += _pointsForCurrentRound();
          _model.target = _targetValue();
          _model.round += 1;
        });
      },
      child: const Text('Awesome!'),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_alertTitle()),
          content: Text("The slider's value is ${_model.current}.\n"
              "You scored ${_pointsForCurrentRound()} points this round."),
          actions: [
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }
}
