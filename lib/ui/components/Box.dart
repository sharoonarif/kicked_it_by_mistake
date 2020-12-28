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
    final isDynamic = box.body.getType() == BodyType.DYNAMIC;
    final bodyCenterXPX = box.body.worldCenter.x * Constants.metersToPixels;
    final bodyCenterYPX = box.body.worldCenter.y * Constants.metersToPixels;

    return Stack(
      children: [
        Positioned(
            left: isDynamic ? bodyCenterXPX - ((box.width / 2) * Constants.metersToPixels) : box.body.position.x * Constants.metersToPixels,
            bottom: isDynamic ? bodyCenterYPX - ((box.height / 2) * Constants.metersToPixels) : box.body.position.y * Constants.metersToPixels,
            child: Transform.rotate(
                angle: box.body.getAngle(),
                child: GestureDetector(
                  onTapUp: box.jump,
                  onLongPress: () => box.destroy(box),
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
