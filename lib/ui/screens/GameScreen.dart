import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameEngine = Provider.of<GameEngine>(context);

    return Container(
      height: 100,
      width: 200,
      color: Colors.amberAccent
    );
  }
}
