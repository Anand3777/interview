import 'package:crewmeister/core/resources/color_manager.dart';
import 'package:crewmeister/core/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


@override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.ffe95d15,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                'HRM',
                style: TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.w600,
                    color: ColorManager.ffffffff),
              ),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  context.goNamed(
                    AppRoute.dashboard.name,
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: const Text(
                  'Authenticate',
                  style: TextStyle(
                    color: ColorManager.ffffffff,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
