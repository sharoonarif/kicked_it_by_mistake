import 'dart:math' show Random;
import 'package:vector_math/vector_math.dart' show degrees;
import 'package:flutter/cupertino.dart';
import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';

class BoxModel {
  final double height;
  final double width;
  final Body body;
  final Shape shape;
  Color color;

  BoxModel(this.height, this.width, this.body, [this.shape]) {
    color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void jump(TapUpDetails tapDownDetails) {
    final pointOfImpact = Vector2(
      (Constants.screenWidth - tapDownDetails.globalPosition.dx) * Constants.pixelsToMeters,
      (Constants.screenHeight - tapDownDetails.globalPosition.dy) * Constants.pixelsToMeters,
    );

    var rand = Random().nextBool();

    debugPrint("Impact: (${pointOfImpact.x * Constants.metersToPixels},${pointOfImpact.y * Constants.metersToPixels})");

    body.applyLinearImpulse(Vector2(00 * (rand ? 1 : -1).toDouble(), 550), pointOfImpact, true);
  }

  void accelerate() {

  }
}
