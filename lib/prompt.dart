import 'package:flutter/material.dart';
import 'text_styles.dart';

class Prompt extends StatelessWidget {
  final int targetValue;

  const Prompt({super.key, required this.targetValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'PUT THE BULLSEYE AS CLOSE AS YOU CAN TO',
            style: LabelTextStyle.bodyText1(context),
          ),
        ),
        Text('$targetValue'),
      ],
    );
  }
}
