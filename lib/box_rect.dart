import 'dart:ui';

import 'package:flutter/gestures.dart';

import 'box_game.dart';

class BoxRect {
  final BoxGame game;

  Rect rect;
  Paint paint;
  bool tapped = false;
  Offset targetLocation;
  double get speed => game.tileSize * 5;

  BoxRect(this.game) {
    rect = Rect.fromLTWH(
      0,
      0,
      game.tileSize * 0.75,
      game.tileSize * 0.75,
    );
    paint = Paint();
    paint.color = Color.fromRGBO(60, 70, 80, 1);
    setTargetLocation(
      game.playRect.width - rect.width,
      0,
    );
  }

  void render(Canvas canvas) {
    canvas.drawRect(rect, paint);
  }

  void update(double t) {
    paint.color = tapped
        ? Color.fromRGBO(255, 255, 160, 1)
        : Color.fromRGBO(50, 50, 50, 1);

    // if (tapped) {
    //   if (rect.bottom >= game.playRect.height || rect.top <= 0) {
    //     rect = rect.translate(0, game.tileSize * t * speed);
    //   } else {
    //     rect = rect.translate(0, game.tileSize * t * speed);
    //     tapped = true;
    //   }
    // }
    //
    //
    if (tapped) {
      print(rect.topLeft);
      double stepDistance = speed * t;
      Offset toTarget = targetLocation - Offset(rect.left, rect.top);

      if (stepDistance < toTarget.distance) {
        Offset stepToTarget = Offset.fromDirection(
          toTarget.direction,
          stepDistance,
        );
        rect = rect.shift(stepToTarget);
      }
      if (rect.top >= game.playRect.top) {
        setTargetLocation(
          game.playRect.width,
          game.playRect.top,
        );
      }
      if (rect.left >= game.playRect.width - rect.width) {
        setTargetLocation(
          game.playRect.width - rect.width,
          game.playRect.height - rect.height,
        );
      }
      if (rect.bottom > game.playRect.height) {
        setTargetLocation(
          0,
          game.playRect.height,
        );
      }
    }
  }

  void setTargetLocation(double x, double y) {
    targetLocation = Offset(x, y);
  }

  void onTapDown(TapDownDetails details) {
    if (rect.contains(details.globalPosition)) {
      tapped = true;
    } else
      tapped = false;
  }
}
