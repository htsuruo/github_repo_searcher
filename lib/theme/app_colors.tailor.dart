// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.app,
  });

  final Color app;

  static final AppColors light = AppColors(
    app: _$AppColors.app[0],
  );

  static final AppColors dark = AppColors(
    app: _$AppColors.app[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppColors copyWith({
    Color? app,
  }) {
    return AppColors(
      app: app ?? this.app,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      app: Color.lerp(app, other.app, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality().equals(app, other.app));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, const DeepCollectionEquality().hash(app));
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get _appColors => Theme.of(this).extension<AppColors>()!;
  Color get app => _appColors.app;
}
