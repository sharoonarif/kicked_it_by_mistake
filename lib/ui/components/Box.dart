import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/models/BoxModel.dart';

class Box extends StatelessWidget {
  final BoxModel box;

  const Box({Key key, this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: box.body.position.x,
      bottom: box.body.position.y,
      child: Container(
        color: Colors.blueAccent,
        width: box.width,
        height: box.height
      )
    );
  }
}