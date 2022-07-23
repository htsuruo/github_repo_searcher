// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'app_colors.dart';

// **************************************************************************
// ThemeTailorGenerator
// **************************************************************************

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.iconOnSurface,
    required this.languageIconSurface,
    required this.starIconSurface,
    required this.watcherIconSurface,
    required this.forkIconSurface,
    required this.infoIconSurface,
  });

  final Color iconOnSurface;
  final Color languageIconSurface;
  final Color starIconSurface;
  final Color watcherIconSurface;
  final Color forkIconSurface;
  final Color infoIconSurface;

  static final AppColors light = AppColors(
    iconOnSurface: _$AppColors.iconOnSurface[0],
    languageIconSurface: _$AppColors.languageIconSurface[0],
    starIconSurface: _$AppColors.starIconSurface[0],
    watcherIconSurface: _$AppColors.watcherIconSurface[0],
    forkIconSurface: _$AppColors.forkIconSurface[0],
    infoIconSurface: _$AppColors.infoIconSurface[0],
  );

  static final AppColors dark = AppColors(
    iconOnSurface: _$AppColors.iconOnSurface[1],
    languageIconSurface: _$AppColors.languageIconSurface[1],
    starIconSurface: _$AppColors.starIconSurface[1],
    watcherIconSurface: _$AppColors.watcherIconSurface[1],
    forkIconSurface: _$AppColors.forkIconSurface[1],
    infoIconSurface: _$AppColors.infoIconSurface[1],
  );

  static final themes = [
    light,
    dark,
  ];

  @override
  AppColors copyWith({
    Color? iconOnSurface,
    Color? languageIconSurface,
    Color? starIconSurface,
    Color? watcherIconSurface,
    Color? forkIconSurface,
    Color? infoIconSurface,
  }) {
    return AppColors(
      iconOnSurface: iconOnSurface ?? this.iconOnSurface,
      languageIconSurface: languageIconSurface ?? this.languageIconSurface,
      starIconSurface: starIconSurface ?? this.starIconSurface,
      watcherIconSurface: watcherIconSurface ?? this.watcherIconSurface,
      forkIconSurface: forkIconSurface ?? this.forkIconSurface,
      infoIconSurface: infoIconSurface ?? this.infoIconSurface,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      iconOnSurface: Color.lerp(iconOnSurface, other.iconOnSurface, t)!,
      languageIconSurface:
          Color.lerp(languageIconSurface, other.languageIconSurface, t)!,
      starIconSurface: Color.lerp(starIconSurface, other.starIconSurface, t)!,
      watcherIconSurface:
          Color.lerp(watcherIconSurface, other.watcherIconSurface, t)!,
      forkIconSurface: Color.lerp(forkIconSurface, other.forkIconSurface, t)!,
      infoIconSurface: Color.lerp(infoIconSurface, other.infoIconSurface, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppColors &&
            const DeepCollectionEquality()
                .equals(iconOnSurface, other.iconOnSurface) &&
            const DeepCollectionEquality()
                .equals(languageIconSurface, other.languageIconSurface) &&
            const DeepCollectionEquality()
                .equals(starIconSurface, other.starIconSurface) &&
            const DeepCollectionEquality()
                .equals(watcherIconSurface, other.watcherIconSurface) &&
            const DeepCollectionEquality()
                .equals(forkIconSurface, other.forkIconSurface) &&
            const DeepCollectionEquality()
                .equals(infoIconSurface, other.infoIconSurface));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(iconOnSurface),
        const DeepCollectionEquality().hash(languageIconSurface),
        const DeepCollectionEquality().hash(starIconSurface),
        const DeepCollectionEquality().hash(watcherIconSurface),
        const DeepCollectionEquality().hash(forkIconSurface),
        const DeepCollectionEquality().hash(infoIconSurface));
  }
}

extension AppColorsBuildContextProps on BuildContext {
  AppColors get _appColors => Theme.of(this).extension<AppColors>()!;
  Color get iconOnSurface => _appColors.iconOnSurface;
  Color get languageIconSurface => _appColors.languageIconSurface;
  Color get starIconSurface => _appColors.starIconSurface;
  Color get watcherIconSurface => _appColors.watcherIconSurface;
  Color get forkIconSurface => _appColors.forkIconSurface;
  Color get infoIconSurface => _appColors.infoIconSurface;
}
