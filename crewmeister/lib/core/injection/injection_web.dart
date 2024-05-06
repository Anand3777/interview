import 'package:crewmeister/core/injection/injection_container.dart';
import 'package:crewmeister/features/dashboard/presentation/bloc/dashboard_page_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class Injection implements InjectionBase {
  @override
  void initialize() {
    var sl = GetIt.I;
    initWeb(sl: sl);
  }
}

Future<void> initWeb({required GetIt sl}) async {
  if (kDebugMode) print('Initializing >> Web : Without Local Database');
  // sl.registerLazySingleton(() => InternetConnection());

  sl.registerFactory(
    () => DashboardPageBloc(),
  );
}
