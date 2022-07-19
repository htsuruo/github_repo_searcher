// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
  });

  final Color background;

  static final AppColors light = AppColors(
    background: _$AppColors.background[0],
  );

  static final AppColors dark = AppColors(
    background: _$AppColors.background[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppColors copyWith({
    Color? background,
  }) {
    return AppColors(
      background: background ?? this.background,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality()
                .equals(background, other.background));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, const DeepCollectionEquality().hash(background));
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get _appColors => Theme.of(this).extension<AppColors>()!;
  Color get background => _appColors.background;
}
