import 'dart:developer';

import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import "package:style_on_app/exports.dart";

x() {}

void main() async {
  await initConfig();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("0ac916c7-8e08-4370-bfc0-1d5aebc6fb5d");

  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    log("Accepted permission: ${accepted}");
  });
  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    log("Notificaiton ->setNotificationWillShowInForegroundHandler ${event.jsonRepresentation()} ");
    event.complete(null);
  });
  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
    log("Notificaiton ->setNotificationOpenedHandler ${result.notification.additionalData} ");

    navigatorKey.currentState!
        .pushNamed(result.notification.additionalData!['cart']);
  });

  runApp(const ProviderScope(child: App()));
}
