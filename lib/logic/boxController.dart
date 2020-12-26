import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:kicked_it_by_mistake/models/boxModel.dart';
import 'package:rxdart/rxdart.dart';

class BoxController {
  BehaviorSubject<List<BoxModel>> boxes;
  final GameEngine _gameEngine;

  BoxController(this._gameEngine) {
    boxes = BehaviorSubject.seeded([]);

    final double halfBoxWidth = 100 * Constants.pixelsToMeters;
    final double halfBoxHeight = 40 * Constants.pixelsToMeters;

    final boxBodyDef = BodyDef();
    boxBodyDef.type = BodyType.DYNAMIC;
    boxBodyDef.position.setFrom(Vector2(((Constants.screenWidth / 2) * Constants.pixelsToMeters) - halfBoxWidth, ((Constants.screenHeight / 2) * Constants.pixelsToMeters) - halfBoxHeight));

    final boxBody = _gameEngine.world.createBody(boxBodyDef);

    final boxShape = PolygonShape();

    boxShape.setAsBox(halfBoxWidth, halfBoxHeight, Vector2(halfBoxWidth, halfBoxHeight), 0);
    
    final boxFixtureDef = FixtureDef();
    boxFixtureDef.setDensity(0.5);
    boxFixtureDef.setRestitution(0.3);
    boxFixtureDef.setShape(boxShape);


    boxBody.createFixture(boxFixtureDef);
    boxes.add([BoxModel(halfBoxHeight * 2, halfBoxWidth * 2, boxBody, boxShape)]);
  }

  dispose() {
    boxes.close();
  }
}