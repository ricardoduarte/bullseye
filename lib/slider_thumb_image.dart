import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SliderThumbImage extends SliderComponentShape {
  final ui.Image? image;

  SliderThumbImage(this.image);

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final thumbImage = image;
    if (thumbImage != null) {
      final canvas = context.canvas;
      final imageOffset = Offset(
        center.dx - (thumbImage.width / 2),
        center.dy - (thumbImage.width / 2),
      );
      var paint = Paint();
      paint.filterQuality = FilterQuality.high;
      canvas.drawImage(thumbImage, imageOffset, paint);
    }
  }
}
