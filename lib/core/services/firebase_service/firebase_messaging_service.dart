import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:orion_safeguard/modules/profile/model/user_model.dart';

import '../../di/service_locator.dart';
import '../local_notification_service/local_notification_service.dart';
import '../storage_service/storage_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final StorageService _localStorage =
      StorageService(sharedPreferences: getIt());
  final LocalNotificationService _localNotificationService =
      LocalNotificationService(); // Use LocalNotificationService

  Future<void> initialize() async {
    await _requestPermissions();
    await _localNotificationService.initialize(); // Initialize notifications
    await _saveDeviceToken();
    _configureFirebaseListeners();
  }

  /// Request notification permissions from the user.
  Future<void> _requestPermissions() async {
    await _firebaseMessaging.requestPermission();
  }

  /// Save Firebase device token for push notifications.
  Future<void> _saveDeviceToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      if (token != null) {
        await _localStorage.setString(UserModel.keyDeviceToken, token);
        debugPrint('Device token: $token');
      }
    } catch (e) {
      debugPrint('Error retrieving device token: $e');
    }
  }

  /// Configure Firebase push notification listeners.
  void _configureFirebaseListeners() {
    FirebaseMessaging.instance.getInitialMessage().then(_handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    FirebaseMessaging.onMessage.listen(_handleMessage);
  }

  /// Handle Firebase messages when the app is opened via notification.
  void _handleMessage(RemoteMessage? message) {
    if (message != null) {
      debugPrint('Opened from notification: ${message.data}');
      _localNotificationService.showNotification(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        payload:
            '${message.notification?.title}/${message.notification?.body}/${message.data['type_id'] ?? ''}',
      );
    }
  }
}
