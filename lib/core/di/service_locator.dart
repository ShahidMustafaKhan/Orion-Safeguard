import 'package:get_it/get_it.dart';
import 'package:orion_safeguard/repository/authentication/authentication_repository.dart';
import 'package:orion_safeguard/repository/notification/notification_http_repository.dart';
import 'package:orion_safeguard/repository/notification/notification_repository.dart';
import 'package:orion_safeguard/repository/profile/profile_http_repository.dart';
import 'package:orion_safeguard/repository/profile/profile_repository.dart';
import 'package:orion_safeguard/repository/shifts/shifts_http_repository.dart';
import 'package:orion_safeguard/repository/shifts/shifts_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/environment.dart';
import '../../repository/alerts/alerts_http_repository.dart';
import '../../repository/alerts/alerts_repository.dart';
import '../../repository/authentication/authentication_http_repository.dart';
import '../../repository/jobApplication/jobApplication_http_repository.dart';
import '../../repository/jobApplication/jobApplication_repository.dart';
import '../services/storage_service/storage_service.dart';

final getIt = GetIt.instance;

void setupLocator(Environment environment) async {
  /// ==================== Environment =========================
  getIt.registerLazySingleton<Environment>(() => environment);

  /// ==================== Shared Pref =========================
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => SharedPreferences.getInstance());

  /// ==================== DataBase ===========================
  getIt.registerSingletonWithDependencies<StorageService>(
    () => StorageService(sharedPreferences: getIt()),
    dependsOn: [SharedPreferences],
  );

  /// ==================== Networking ===========================
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationHttpRepository());
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileHttpRepository());
  getIt.registerLazySingleton<ShiftsRepository>(() => ShiftsHttpRepository());
  getIt.registerLazySingleton<NotificationRepository>(
      () => NotificationHttpRepository());
  getIt.registerLazySingleton<AlertsRepository>(() => AlertsHttpRepository());
  getIt.registerLazySingleton<JobApplicationRepository>(
      () => JobApplicationHttpRepository());

  /// ==================== Modules ===========================
}
