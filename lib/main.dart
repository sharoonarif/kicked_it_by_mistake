import 'package:flutter/material.dart';
import 'package:kicked_it_by_mistake/logic/gameEngine.dart';
import 'package:kicked_it_by_mistake/ui/screens/GameScreen.dart';
import 'package:provider/provider.dart';

void main() {
  final GameEngine gameEngine = GameEngine()..start();

    runApp(MultiProvider(
      providers: [
        Provider(
          create: (_) => gameEngine,
          dispose: (_, __) => gameEngine.dispose(),
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
    return GameScreen();
  }
}