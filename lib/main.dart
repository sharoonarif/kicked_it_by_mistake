import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/logic/boxController.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:kicked_it_by_mistake/logic/worldController.dart';
import 'package:kicked_it_by_mistake/ui/screens/GameScreen.dart';
import 'package:provider/provider.dart';

void main() {
  final gameEngine = GameEngine()..start();
  final worldController = WorldController(gameEngine);
  final boxController = BoxController(gameEngine);

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
    return Stack(
      children: [
        GameScreen()
      ]
    );
  }
}