import 'package:flutter/material.dart';
import 'package:forge2d/forge2d.dart' as Forge;
// import 'package:kicked_it_by_mistake/ui/components/CenterVertex.dart';
import 'package:flutter/cupertino.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/models/boxModel.dart';

class Box extends StatelessWidget {
  final BoxModel box;

  const Box(this.box);

  @override
  Widget build(BuildContext context) {
    final isDynamic = box.body.getType() == Forge.BodyType.DYNAMIC;
    final bodyCenterXPX = box.body.worldCenter.x * Constants.metersToPixels;
    final bodyCenterYPX = box.body.worldCenter.y * Constants.metersToPixels;

    // final fixture = box.body.getFixtureList();
    // final Forge.PolygonShape polygon = fixture.getShape();
    // final transformVertices = polygon.vertices.map((v) => box.body.getWorldPoint(v));

    return Stack(
      children: [
        Positioned(
            left: isDynamic
                ? bodyCenterXPX - ((box.width / 2) * Constants.metersToPixels)
                : box.body.position.x * Constants.metersToPixels,
            bottom: isDynamic
                ? bodyCenterYPX - ((box.height / 2) * Constants.metersToPixels)
                : box.body.position.y * Constants.metersToPixels,
            child: Transform.rotate(
                angle: -box.body.getAngle(),
                child: GestureDetector(
                  onTapUp: box.jump,
                  onLongPress: () => box.destroy(box),
                  child: Container(
                    width: box.width * Constants.metersToPixels,
                    height: box.height * Constants.metersToPixels,
                    decoration: BoxDecoration(
                      color: box.color,
                      boxShadow: isDynamic
                          ? [
                              BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 0,
                                  blurRadius: 6,
                                  offset: Offset.zero)
                            ]
                          : [],
                    ),
                  ),
                ))),
        // ...(isDynamic
        //     ? [
        //         ...transformVertices
        //             .map((tf) => CenterVertex(tf, Colors.yellow))
        //             .toList(),
        //         CenterVertex(box.body.worldCenter)
        //       ]
        //     : [])
      ],
    );
  }
}
