import 'dart:math' show Random;
import 'package:flutter/cupertino.dart';
import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';

class BoxModel {
  final double height;
  final double width;
  final Body body;
  final Shape shape;
  Function(BoxModel) destroy;
  Color color;

  BoxModel(this.height, this.width, this.body, [this.shape, this.destroy]) {
    color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void jump(TapUpDetails tapDownDetails) {
    final pointOfImpact = Vector2(
      tapDownDetails.globalPosition.dx * Constants.pixelsToMeters,
      (Constants.screenHeight - tapDownDetails.globalPosition.dy) * Constants.pixelsToMeters,
    );

    var rand = Random().nextBool();

    body.applyLinearImpulse(Vector2(0, 1000), pointOfImpact, true);
  }

  void accelerate() {

  }
}
