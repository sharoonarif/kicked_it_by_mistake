import 'package:kicked_it_by_mistake/ui/components/CenterVertex.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forge2d/forge2d.dart' show BodyType;
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/models/boxModel.dart';

class Box extends StatelessWidget {
  final BoxModel box;

  const Box(this.box);

  @override
  Widget build(BuildContext context) {
    var isDynamic = box.body.getType() == BodyType.DYNAMIC;
    var bodyCenterXPX = box.body.worldCenter.x * Constants.metersToPixels;
    var bodyCenterYPX = box.body.worldCenter.y * Constants.metersToPixels;

    return Stack(
      children: [
        Positioned(
            left: isDynamic ? bodyCenterXPX - ((box.width / 2) * Constants.metersToPixels) : box.body.position.x * Constants.metersToPixels, // (bodyCenterXPX - (box.width / 2)) * Constants.metersToPixels,
            bottom: isDynamic ? bodyCenterYPX - ((box.height / 2) * Constants.metersToPixels) : box.body.position.y * Constants.metersToPixels, // (bodyCenterXPX - (box.width / 2)) * Constants.metersToPixels,
            child: Transform.rotate(
                angle: box.body.getAngle(),
                child: GestureDetector(
                  onTapUp: box.jump,
                  child: Container(
                      color: box.color,
                      width: box.width * Constants.metersToPixels,
                      height: box.height * Constants.metersToPixels),
                ))),
        ...(isDynamic ? [CenterVertex(box.body.worldCenter)] : [])
      ],
    );
  }
}
