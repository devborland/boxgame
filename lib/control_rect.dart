import 'dart:ui';

import 'package:flutter/gestures.dart';

import 'box_game.dart';

class ControlRect {
  final BoxGame game;

  Rect rect;
  Paint paint;

  ControlRect(this.game) {
    rect = Rect.fromLTWH(
      0,
      game.screenSize.height * 0.7,
      game.screenSize.width,
      game.screenSize.height * 0.3,
    );

    paint = Paint()..color = Color(0xFF303952);
  }

  void render(Canvas canvas) {
    canvas.drawRect(rect, paint);
  }

  void update(double t) {}
}
