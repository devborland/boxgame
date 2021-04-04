import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'box_rect.dart';
import 'control_rect.dart';

class BoxGame extends Game with TapDetector {
  Size screenSize;
  double tileSize;
  bool hasWon = false;
  Rect playRect;
  BoxRect boxRect;
  ControlRect controlRect;

  BoxGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    boxRect = BoxRect(this);
    controlRect = ControlRect(this);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  @override
  void render(Canvas canvas) {
    playRect = Rect.fromLTWH(
      0,
      0,
      screenSize.width - 0,
      screenSize.height * 0.7,
    );
    Paint bgPaint = Paint();
    bgPaint.color = Color.fromRGBO(110, 120, 80, 1);
    canvas.drawRect(playRect, bgPaint);

    boxRect.render(canvas);
    controlRect.render(canvas);
  }

  @override
  void update(double t) {
    boxRect.update(t);
  }

  void onTapDown(TapDownDetails details) {
    boxRect.onTapDown(details);
  }
}
