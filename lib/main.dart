import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_repo_searcher/app.dart';

void main() {
  runApp(
    DevicePreview(
      // DevicePreviewはスマートフォンサイズでは設定がしづらいので、
      // macOSでのビルドのみ使うようにする
      // iOS/Android通常利用では操作感を確かめる用途もあるのでデバイスプレビューは使わない
      enabled: !kIsWeb && Platform.isMacOS && kDebugMode,
      builder: (context) => const App(),
    ),
  );
}
