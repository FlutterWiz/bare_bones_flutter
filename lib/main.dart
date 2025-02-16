import 'package:bare_bones_flutter/core/config/app_config.dart';
import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/init/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiKey = AppConfig.apiKey;
  final appId = AppConfig.appId;
  final messagingSenderId = AppConfig.messagingSenderId;
  final projectId = AppConfig.projectId;

  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: apiKey, appId: appId, messagingSenderId: messagingSenderId, projectId: projectId),
  );

  injectionSetup();

  runApp(const AppWidget());
}
