import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repo_searcher/app.dart';
import 'package:github_repo_searcher/common/common.dart';
import 'package:github_repo_searcher/logger.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_logger/simple_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger.setLevel(
    kReleaseMode ? Level.SEVERE : Level.FINEST,
    includeCallerInfo: kDebugMode,
  );
  // Webブラウザ表示時のURLから`#`を取り除く
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  late final SharedPreferences sharedPreferences;
  await Future.wait([
    SharedPreferences.getInstance().then((sp) => sharedPreferences = sp),
  ]);
  runApp(
    DevicePreview(
      // DevicePreviewはスマートフォンサイズでは設定がしづらいので、
      // macOSでのビルドのみ使うようにする
      // iOS/Android通常利用では操作感を確かめる用途もあるのでデバイスプレビューは使わない
      enabled: !kIsWeb && Platform.isMacOS && kDebugMode,
      builder: (context) => ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: const App(),
      ),
    ),
  );
}
