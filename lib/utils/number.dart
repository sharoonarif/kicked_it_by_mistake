import 'dart:math';

int randomBetween(int min, int max) {
  final rn = new Random();
  return min + rn.nextInt(max - min);
}