import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/app.dart';
import 'package:github_repo_searcher/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_logger/simple_logger.dart';

void main() {
  logger.setLevel(
    kReleaseMode ? Level.SEVERE : Level.FINEST,
    includeCallerInfo: kDebugMode,
  );
  // Webブラウザ表示時のURLから`#`を取り除く
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  runApp(
    DevicePreview(
      // DevicePreviewはスマートフォンサイズでは設定がしづらいので、
      // macOSでのビルドのみ使うようにする
      // iOS/Android通常利用では操作感を確かめる用途もあるのでデバイスプレビューは使わない
      enabled: !kIsWeb && Platform.isMacOS && kDebugMode,
      builder: (context) => const ProviderScope(
        child: App(),
      ),
    ),
  );
}
