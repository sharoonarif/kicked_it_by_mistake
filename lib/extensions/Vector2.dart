import 'package:forge2d/forge2d.dart';

extension VectorDebug on Vector2 {
  List<String> toDebugPrint([int decimalPlaces = 3]) =>
    [this.x.toStringAsFixed(decimalPlaces), this.y.toStringAsFixed((decimalPlaces))];
} 