import 'package:flutter/material.dart';

class LabelTextStyle {
  static TextStyle? bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12.0,
      color: Colors.black,
      letterSpacing: 2.0,
    );
  }
}

class ScoreNumberTextStyle {
  static TextStyle? headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
      color: Colors.black,
    );
  }
}

class TargetTextStyle {
  static TextStyle? bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 32.0,
      color: Colors.black,
    );
  }
}
