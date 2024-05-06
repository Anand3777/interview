import 'package:crewmeister/core/resources/color_manager.dart';
import 'package:crewmeister/core/route_manager.dart';
import 'package:crewmeister/core/shared/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      context.goNamed(
        AppRoute.landing.name,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.ffe95d15,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Text(
                'HRM',
                style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.ffffffff),
              ),
              Spacer(),
              ProgressLoader(
                color: Colors.white,
              ),
              Text(
                '\nComplete systmatic solution\nby\nCrewmeister',
                style: TextStyle(
                  fontSize: 30,
                  color: ColorManager.ffffffff,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
