import 'dart:io' show Platform;
import 'package:crewmeister/core/resources/constants.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformChecker {
  static bool get isLargerDevice => kIsWeb || Platform.isWindows;
  static bool get isSmallDevice => Constants.height < 700;
}
