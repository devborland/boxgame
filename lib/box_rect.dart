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
  }

  void render(Canvas canvas) {
    canvas.drawRect(rect, paint);
  }

  void update(double t) async {
    paint.color = tapped
        ? Color.fromRGBO(255, 255, 160, 1)
        : Color.fromRGBO(50, 50, 50, 1);

    if (tapped) {
      print(rect.right);
      moveRight(game.playRect.width - rect.width, t);
      if (rect.right >= game.playRect.width - 1) {
        tapped = false;
      }
      if (tapped) {}
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

  void moveRight(double x, double t) {
    setTargetLocation(x, rect.top);
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(rect.left, rect.top);

    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(
        toTarget.direction,
        stepDistance,
      );
      rect = rect.shift(stepToTarget);
    }
  }

  void moveDown(double t) {
    setTargetLocation(game.playRect.width - rect.width, game.playRect.height);
    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(rect.left, rect.top);

    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(
        toTarget.direction,
        stepDistance,
      );
      rect = rect.shift(stepToTarget);
    }
  }
}
