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
      originX + localCenterX + localCenterX,
      originY + localCenterY,
    );
    // body.applyLinearImpulse(Vector2(30,80), Vector2(bodyOrigin.x, bodyOrigin.y), true);
    // body.applyLinearImpulse(Vector2(0, 40), body.position, true);
      // body.applyForce(Vector2(0, 1000), Vector2( 10, 10));
// 
    // body.applyAngularImpulse(100);
    // body.applyTorque(100);
    body.applyForce(Vector2(0, 10000), body.position);
  }

  void accelerate() {
    
  }
}
