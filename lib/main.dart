import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/core/services/firebase_service/firebase_messaging_service.dart';

import 'app/bloc/app_bloc_observer.dart';
import 'app/bloc/bloc_di.dart';
import 'app/my_app.dart';
import 'config/environment.dart';
import 'core/initializer/init_app.dart';
import 'core/initializer/init_parse_server.dart';
import 'core/services/local_notification_service/local_notification_service.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  LocalNotificationService service = LocalNotificationService();
  await Firebase.initializeApp();
  await service.showNotification(
      title: message.notification!.title!, body: message.notification!.body!);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await initApp(Environment.fromEnv(AppEnv.dev));
  await initParseServer();
  await FirebaseMessagingService().initialize();
  runApp(const BlocDI(child: OrionSafeguard()));
}
