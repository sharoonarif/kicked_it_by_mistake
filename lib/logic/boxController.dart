import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/logic/worldController.dart';
import 'package:kicked_it_by_mistake/models/BoxModel.dart';
import 'package:rxdart/rxdart.dart';

class BoxController {
  BehaviorSubject<List<BoxModel>> boxes;
  final WorldController _worldController;

  BoxController(this._worldController) {
    boxes = BehaviorSubject.seeded([]);

    final double halfBoxWidth = 140;
    final double halfBoxHeight = 70;

    final boxBodyDef = BodyDef();
    boxBodyDef.type = BodyType.DYNAMIC;
    boxBodyDef.position.setFrom(Vector2((Constants.screenWidth / 2) - halfBoxWidth, (Constants.screenHeight / 2) - halfBoxHeight));

    final boxBody = _worldController.world.createBody(boxBodyDef);
    final boxShape = PolygonShape();

    boxShape.setAsBox(halfBoxWidth, halfBoxHeight, Vector2(halfBoxWidth, halfBoxHeight), 0);
    boxBody.createFixtureFromShape(boxShape);

    boxes.add([BoxModel(halfBoxHeight * 2, halfBoxWidth * 2, boxBody)]);
  }

  dispose() {
    boxes.close();
  }
}