import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/logic/boxController.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:kicked_it_by_mistake/logic/worldController.dart';
import 'package:kicked_it_by_mistake/ui/components/Box.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameEngine = Provider.of<GameEngine>(context);
    final worldController = Provider.of<WorldController>(context);
    final boxController = Provider.of<BoxController>(context);

    return Stack(
      children: [
        Box(worldController.floor),
        Box(worldController.leftWall),
        Box(worldController.rightWall),
        StreamBuilder(
          stream: gameEngine.gameLoop,
          builder: (_, __) =>
            boxController.boxes.value.isEmpty ? SizedBox.shrink() :
            Stack(
              children: boxController.boxes.value.map((b) =>
                Box(b)
              ).toList()
            )
        )
      ]
    );
  }
}
