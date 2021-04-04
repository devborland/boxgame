import 'dart:ui';

import 'package:flutter/gestures.dart';

import 'box_game.dart';

class BoxRect {
  final BoxGame game;

  Rect rect;
  Paint paint;
  bool tapped = false;
  int directionSpeed = 5;

  BoxRect(this.game) {
    rect = Rect.fromLTWH(
      game.tileSize * 4,
      game.tileSize * 6,
      game.tileSize / 2,
      game.tileSize / 2,
    );
    paint = Paint();

    paint.color = Color.fromRGBO(50, 50, 50, 1);
  }

  void render(Canvas canvas) {
    canvas.drawRect(rect, paint);
  }

  void update(double t) {
    paint.color = tapped
        ? Color.fromRGBO(255, 255, 160, 1)
        : Color.fromRGBO(50, 50, 50, 1);

    if (tapped) {
      if (rect.bottom >= game.playRect.height || rect.top <= 0) {
        // tapped = false;
        directionSpeed *= -1;
        rect = rect.translate(0, game.tileSize * t * directionSpeed);
      } else {
        rect = rect.translate(0, game.tileSize * t * directionSpeed);
        tapped = true;
      }
    }
  }

  void onTapDown(TapDownDetails details) {
    if (rect.contains(details.globalPosition)) {
      tapped = true;
    } else
      tapped = false;
  }
}
