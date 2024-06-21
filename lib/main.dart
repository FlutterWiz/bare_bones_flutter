import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/init/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  injectionSetup();

  runApp(const App());
}
