import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/bloc/app_bloc_observer.dart';
import 'app/bloc/bloc_di.dart';
import 'app/my_app.dart';
import 'config/environment.dart';
import 'core/initializer/init_app.dart';
import 'core/initializer/init_parse_server.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await initApp(Environment.fromEnv(AppEnv.dev));
  await initParseServer();
  runApp(const BlocDI(child: OrionSafeguard()));
}
