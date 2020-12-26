import 'dart:math' show Random;
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
      tapDownDetails.globalPosition.dx * Constants.pixelsToMeters,
      (Constants.screenHeight - tapDownDetails.globalPosition.dy) * Constants.pixelsToMeters
    );

    var bodyCenterX = body.worldCenter.x;
    var bodyCenterY = body.worldCenter.y;
    var localCenterX = body.getLocalCenter().x;
    var localCenterY = body.getLocalCenter().y;
    var originX = body.position.x;
    var originY = body.position.y;
    var impactX = pointOfImpact.x;
    var impactY = pointOfImpact.y;

    var madeUpCenter = Vector2(
      1, 1
      //body.worldCenter.y
    );

    debugPrint("Body Center: (${body.worldCenter.x}, ${body.worldCenter.y})");
    debugPrint("Body Origin: (${body.position.x}, ${body.position.y})");

    body.applyLinearImpulse(Vector2(-10,0), madeUpCenter, true);
  }

  void accelerate() {
    
  }
}
