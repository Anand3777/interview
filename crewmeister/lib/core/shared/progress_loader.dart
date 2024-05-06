import 'package:crewmeister/core/resources/color_manager.dart';
import 'package:crewmeister/core/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class ProgressLoader extends StatelessWidget {
  final Color? color;

  final bool? isLoading;
  const ProgressLoader({
    this.color = ColorManager.ffe95d15,
    super.key, this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: Constants.size_48,
          width: Constants.size_48,
          child: LoadingIndicator(
            indicatorType: Indicator.ballSpinFadeLoader,
            colors: [color!],
            strokeWidth: Constants.size_2,
            backgroundColor: Colors.transparent,
            pathBackgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
