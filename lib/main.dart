import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_searcher/app.dart';

void main() {
  runApp(
    DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: kDebugMode,
      builder: (context) => const App(),
    ),
  );
}
