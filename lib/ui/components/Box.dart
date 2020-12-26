import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/logic/constants.dart';
import 'package:kicked_it_by_mistake/models/boxModel.dart';

class Box extends StatelessWidget {
  final BoxModel box;

  const Box(this.box);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (box.body.position.x) * Constants.metersToPixels,
      bottom: box.body.position.y * Constants.metersToPixels,
      child: GestureDetector(
        onTapUp: box.jump,
        child: Transform.rotate(
          angle: box.body.getAngle(),
          origin: Offset.fromDirection(0, (box.width /  2) * Constants.metersToPixels),
          child: Container(
            color: box.color,
            width: box.width * Constants.metersToPixels,
            height: box.height * Constants.metersToPixels
          ),
        )
      )
    );
  }
}