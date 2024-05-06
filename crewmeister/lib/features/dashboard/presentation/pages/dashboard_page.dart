import 'package:crewmeister/core/injection/injection_container.dart';
import 'package:crewmeister/features/dashboard/presentation/bloc/dashboard_page_bloc.dart';
import 'package:crewmeister/features/dashboard/presentation/pages/dashboard_page_big.dart';
import 'package:crewmeister/features/dashboard/presentation/pages/dashboard_page_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return sl<DashboardPageBloc>();
      },
      child: isWeb(context)
          ? const DashboardPageBig()
          : const DashboardPageSmall(),
    );
  }
}

bool isWeb(BuildContext context) => MediaQuery.of(context).size.width > 480;
