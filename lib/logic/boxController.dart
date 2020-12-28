import 'dart:async';

import 'package:forge2d/forge2d.dart' hide Timer;
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:kicked_it_by_mistake/models/boxModel.dart';
import 'package:rxdart/rxdart.dart';


const maxBoxes = 30;

class BoxController {
  BehaviorSubject<List<BoxModel>> boxes;
  final GameEngine _gameEngine;

  BoxController(this._gameEngine) {
    boxes = BehaviorSubject.seeded([]);

    Timer.periodic(Duration(seconds: 2), addBox);
  }

  void addBox(_) {
    if (boxes.value.length >= maxBoxes) {
      final toRemove = boxes.value.length - maxBoxes - 1;

      for (var i = 0; i < toRemove; i++) {
        destroyBox(boxes.value.elementAt(i));
      }
    }

    final double halfBoxWidth = 30 * Constants.pixelsToMeters;
    final double halfBoxHeight = 30 * Constants.pixelsToMeters;
    
    final boxBodyDef = BodyDef();
    boxBodyDef.type = BodyType.DYNAMIC;
    boxBodyDef.position.setFrom(Vector2(((Constants.screenWidth / 2) * Constants.pixelsToMeters) - halfBoxWidth, ((Constants.screenHeight / 2) * Constants.pixelsToMeters) - halfBoxHeight));
    
    final boxBody = _gameEngine.world.createBody(boxBodyDef);
    
    final boxShape = PolygonShape();
    
    boxShape.setAsBox(halfBoxWidth, halfBoxHeight, Vector2(halfBoxWidth, halfBoxHeight), 0);
    
    final boxFixtureDef = FixtureDef();
    boxFixtureDef.setDensity(5);
    boxFixtureDef.setRestitution(0.1);
    boxFixtureDef.setShape(boxShape);
    
    boxBody.createFixture(boxFixtureDef);

    final currentBoxes = boxes.value;
    currentBoxes.add(BoxModel(halfBoxHeight * 2, halfBoxWidth * 2, boxBody, boxShape, destroyBox));
    boxes.add(currentBoxes);
  }

  destroyBox(BoxModel box) {
    _gameEngine.world.destroyBody(box.body);
    final currentBoxes = boxes.value;
    currentBoxes.remove(box);

    boxes.add(currentBoxes);
  }

  dispose() {
    boxes.close();
  }
}