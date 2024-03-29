import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onPressed;

  const StyledButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Colors.black,
      splashColor: Colors.redAccent,
      onPressed: onPressed,
      shape: const CircleBorder(side: BorderSide(color: Colors.white)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
