import 'package:intl/intl.dart';

final compactFmt = NumberFormat.compact();

extension IntX on int {
  String get compact => compactFmt.format(this);
}
