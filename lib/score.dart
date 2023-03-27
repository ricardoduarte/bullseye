import 'package:bullseye/text_styles.dart';
import 'package:flutter/material.dart';
import 'styled_button.dart';
import 'about.dart';

class Score extends StatelessWidget {
  const Score(
      {super.key,
      required this.totalScore,
      required this.round,
      required this.onStartOver});

  final int totalScore;
  final int round;
  final VoidCallback onStartOver;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        StyledButton(
            icon: Icons.refresh,
            onPressed: () {
              onStartOver();
            }),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Score: ',
                  style: LabelTextStyle.bodyLarge(context),
                ),
                Text(
                  '$totalScore',
                  style: ScoreNumberTextStyle.headlineMedium(context),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Row(
            children: <Widget>[
              Text('Round: ',
                  style: LabelTextStyle.bodyLarge(
                    context,
                  )),
              Text(
                '$round',
                style: ScoreNumberTextStyle.headlineMedium(context),
              ),
            ],
          ),
        ),
        StyledButton(
          icon: Icons.info,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutPage()));
          },
        ),
      ],
    );
  }
}
