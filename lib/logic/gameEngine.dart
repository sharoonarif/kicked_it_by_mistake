import 'dart:async';
import 'dart:ui';
import 'package:forge2d/forge2d.dart';
import 'package:kicked_it_by_mistake/models/enums.dart';
import 'package:rxdart/rxdart.dart';

const TIME_STEP = 1/60;
const VELOCITY_ITS = 6;
const POSITION_ITS = 3;

class GameEngine {
  final Vector2 gravity = Vector2(0, -9.8 * window.devicePixelRatio);
  World world;

  BehaviorSubject<Null> gameLoop;
  BehaviorSubject<GameState> gameState;
  StreamSubscription _subscription;
  Stream _intervalStream;

  GameEngine() {
    gameLoop = BehaviorSubject<Null>();
    gameState = BehaviorSubject<GameState>.seeded(GameState.NotStarted);
    world = World(gravity);
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
    world.stepDt(TIME_STEP, VELOCITY_ITS, POSITION_ITS);
  }

  dispose() {
    _subscription.cancel();
    gameLoop.close();
    gameState.close();
    world.clearForces();
  }
}
