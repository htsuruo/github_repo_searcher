import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

final fmt = NumberFormat.compact();

extension IntX on int {
  String get compact => fmt.format(this);
}
