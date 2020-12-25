import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/models/BoxModel.dart';

import 'gameEngine.dart';

const TIME_STEP = 1/60;
const VELOCITY_ITS = 6;
const POSITION_ITS = 3;

class WorldController {
  World world;
  BoxModel floor;
  final Vector2 gravity = Vector2(0, -9.8);
  final GameEngine _gameEngine;

  WorldController(this._gameEngine) {
    world = World(gravity);
    createFloor();
    _gameEngine.gameLoop.listen(step);
  }

  createFloor() {
    final double halfFloorWidth = Constants.screenWidth / 2;
    final double halfFloorHeight = 35;
    
    final floorBodyDef = BodyDef();
    floorBodyDef.type = BodyType.STATIC;
    floorBodyDef.position.setZero();
    
    final floorBody = world.createBody(floorBodyDef);

    final floorShape = PolygonShape();
    floorShape.setAsBox(halfFloorWidth, halfFloorHeight, Vector2(halfFloorWidth, halfFloorHeight), 0);

    floorBody.createFixtureFromShape(floorShape);

    floor = BoxModel(halfFloorHeight * 2, halfFloorWidth * 2, floorBody);
  }

  step(_) {
    world.stepDt(TIME_STEP, VELOCITY_ITS, POSITION_ITS);
  }

  dispose() {
    world.clearForces();
  }
}