import 'package:crewmeister/core/resources/constants.dart';
import 'package:crewmeister/core/route_manager.dart';
import 'package:crewmeister/core/util/platform_checker.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      locale: WidgetsBinding.instance.platformDispatcher.locale,
      title: Constants.appName,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        double textScale = PlatformChecker.isLargerDevice
            ? (data.size.width < Constants.minScreenWidthWindows)
                ? ((data.size.width) / Constants.size_1440)
                : 1.0
            : (data.size.width) / Constants.size_350;
        return MediaQuery(
          data: data.copyWith(textScaler: TextScaler.linear(textScale)),
          child: child!,
        );
      },
    );
  }
}
