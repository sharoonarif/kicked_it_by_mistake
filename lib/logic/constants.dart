import 'dart:ui';

class Constants {
  static final double screenHeight = (window.physicalSize.height / window.devicePixelRatio);
  static final double screenWidth = (window.physicalSize.width / window.devicePixelRatio);
  static final double metersToPixels = 32;
  static final double pixelsToMeters = 1 / metersToPixels;
}