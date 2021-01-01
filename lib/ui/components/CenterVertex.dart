import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forge2d/forge2d.dart' show Vector2;
import 'package:kicked_it_by_mistake/logic/constants.dart';

class CenterVertex extends StatelessWidget {
  final Vector2 _bodyCenter;
  final double radius = 2;
  final Color _color;

  const CenterVertex(this._bodyCenter, [this._color = Colors.white]);
  
  @override
  Widget build(BuildContext context) {
    var left = (_bodyCenter.x * Constants.metersToPixels) - radius;
    var bottom = (_bodyCenter.y * Constants.metersToPixels) - radius;

    return Positioned(
      left: left,
      bottom: bottom,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: _color
        ),
      )
    );
  }
}