import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'box_game.dart';

void main() async {
  BoxGame game = BoxGame();
  runApp(game.widget);
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
}
