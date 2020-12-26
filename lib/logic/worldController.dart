import 'package:flutter/cupertino.dart';
import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/models/boxModel.dart';

import 'gameEngine.dart';

class WorldController {
  BoxModel floor;
  BoxModel leftWall;
  BoxModel rightWall;
  final GameEngine _gameEngine;

  WorldController(this._gameEngine) {
    createFloor();
    createWalls();
  }

  createFloor() {
    final double halfFloorWidth = (Constants.screenWidth / 2) * Constants.pixelsToMeters;
    final double halfFloorHeight = 35 * Constants.pixelsToMeters;
    
    final floorBodyDef = BodyDef();
    floorBodyDef.type = BodyType.STATIC;
    floorBodyDef.position.setZero();
    
    final floorBody = _gameEngine.world.createBody(floorBodyDef);

    final floorShape = PolygonShape();
    floorShape.setAsBox(halfFloorWidth, halfFloorHeight, Vector2(halfFloorWidth, halfFloorHeight), 0);

    floorBody.createFixtureFromShape(floorShape);

    floor = BoxModel(halfFloorHeight * 2, halfFloorWidth * 2, floorBody);
  }

  createWalls() {
    final double halfWallHeight = (Constants.screenHeight / 2) * Constants.pixelsToMeters;
    final double halfWallWidth = 18 * Constants.pixelsToMeters;
    
    final leftWallBodyDef = BodyDef();
    leftWallBodyDef.type = BodyType.STATIC;
    leftWallBodyDef.position.setZero();
    
    final leftWallBody = _gameEngine.world.createBody(leftWallBodyDef);

    final leftWallShape = PolygonShape();
    leftWallShape.setAsBox(halfWallWidth, halfWallHeight, Vector2(halfWallWidth, halfWallHeight), 0);

    leftWallBody.createFixtureFromShape(leftWallShape);

    leftWall = BoxModel(halfWallHeight * 2, halfWallWidth * 2, leftWallBody);

    final rightWallBodyDef = BodyDef();
    rightWallBodyDef.type = BodyType.STATIC;
    rightWallBodyDef.position.setFrom(Vector2(
      (Constants.screenWidth * Constants.pixelsToMeters) - (halfWallWidth * 2),
      0
    ));
    
    final rightWallBody = _gameEngine.world.createBody(rightWallBodyDef);

    final rightWallShape = PolygonShape();
    rightWallShape.setAsBox(halfWallWidth, halfWallHeight, Vector2(halfWallWidth, halfWallHeight), 0);

    rightWallBody.createFixtureFromShape(rightWallShape);

    rightWall = BoxModel(halfWallHeight * 2, halfWallWidth * 2, rightWallBody);
  }

  dispose() {
    debugPrint("Garbage is all that has survived");
  }
}