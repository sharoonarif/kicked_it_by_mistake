import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/logic/boxController.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:kicked_it_by_mistake/logic/gravityController.dart';
import 'package:kicked_it_by_mistake/logic/worldController.dart';
import 'package:kicked_it_by_mistake/ui/screens/GameScreen.dart';
import 'package:provider/provider.dart';

void main() {
  final gameEngine = GameEngine()..start();
  final worldController = WorldController(gameEngine);
  final boxController = BoxController(gameEngine);
  final gravityController = GravityController(gameEngine, boxController);

  runApp(MultiProvider(
    providers: [ 
      Provider(
        create: (_) => gameEngine,
        dispose: (_, __) => gameEngine.dispose(),
      ),
      Provider(
        create: (_) => worldController,
        dispose: (_, __) => worldController.dispose(),
      ),
      Provider(
        create: (_) => boxController,
        dispose: (_, __) => boxController.dispose(),
      ),
      Provider(
        create: (_) => gravityController,
        dispose: (_, __) => gravityController.dispose(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KickedItByMistake(),
    );
  }
}

class KickedItByMistake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gravityController = Provider.of<GravityController>(context);

    return GestureDetector(
      onLongPressStart: gravityController.setGravity,
      onLongPressEnd: gravityController.resetGravity,
      onLongPressMoveUpdate: gravityController.moveGravity,
      child: Container(
        color: Colors.pink,
        child: GameScreen(),
      ),
    );
  }
}
