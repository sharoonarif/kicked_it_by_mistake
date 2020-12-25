import 'dart:async';
import 'package:kicked_it_by_mistake/models/enums.dart';
import 'package:rxdart/rxdart.dart';

class GameEngine {
  BehaviorSubject<Null> gameLoop;
  BehaviorSubject<GameState> gameState;
  StreamSubscription _subscription;
  Stream _intervalStream;

  GameEngine() {
    gameLoop = BehaviorSubject<Null>();
    gameState = BehaviorSubject<GameState>.seeded(GameState.NotStarted);
  }

  start() {
    gameState.add(GameState.InGame);
    resume();
  }

  end() {
    _subscription.cancel();
    gameState.add(GameState.Dead);
  }

  reset() {
    gameState.add(GameState.NotStarted);
  }

  pause() {
    _subscription.cancel();
    gameState.add(GameState.Paused);
  }

  resume() {
    _intervalStream = Stream<Null>.periodic(Duration(milliseconds: 16));
    _subscription = _intervalStream.listen(run);
    gameState.add(GameState.InGame);
  }

  run(_) {
    gameLoop.add(null);
  }

  dispose() {
    _subscription.cancel();
    gameLoop.close();
    gameState.close();
  }
}
