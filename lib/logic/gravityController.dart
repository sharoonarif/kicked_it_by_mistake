import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/boxController.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:rxdart/rxdart.dart';

import 'constants.dart';

class GravityController {
  final GameEngine _gameEngine;
  final BoxController _boxController;
  BehaviorSubject<Vector2> _gravityPoint;
  StreamSubscription<Vector2> _sub;


  GravityController(this._gameEngine, this._boxController) {
    _gravityPoint = BehaviorSubject.seeded(null);
  }

  void setGravity(LongPressStartDetails details) {
    final pointOfImpact = Vector2(
      details.globalPosition.dx * Constants.pixelsToMeters,
      (Constants.screenHeight - details.globalPosition.dy) * Constants.pixelsToMeters,
    );

    _gravityPoint.add(pointOfImpact);
    _gameEngine.world.setGravity(Vector2.zero());
    _sub = _gameEngine.gameLoop.listen(updateGravity);
  }

  void moveGravity(LongPressMoveUpdateDetails details) {
    final pointOfImpact = Vector2(
      details.globalPosition.dx * Constants.pixelsToMeters,
      (Constants.screenHeight - details.globalPosition.dy) * Constants.pixelsToMeters,
    );

    _gravityPoint.add(pointOfImpact);
  }

  void resetGravity(_) {
    _gameEngine.world.setGravity(_gameEngine.gravity);
    _gravityPoint.add(null);
    _sub.cancel();
  }

  void updateGravity(_) {
    _boxController.boxes.value.forEach((box) {
      var gravityDirection = Vector2.copy(_gravityPoint.value)
        ..sub(box.body.worldCenter)
        ..scale(15);

      box.body.applyForceToCenter(gravityDirection);
    });
  }

  void dispose() {
    _gravityPoint.close();
    _sub.cancel();
  }
}