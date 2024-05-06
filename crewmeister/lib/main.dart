import 'package:crewmeister/core/app.dart';
import 'package:crewmeister/core/injection/injection_web.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injection injectionNative = Injection();
  injectionNative.initialize();
  runApp(const MyApp());
}
