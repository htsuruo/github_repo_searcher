import 'package:intl/intl.dart';

final fmt = NumberFormat.compact();

extension IntX on int {
  String get compact => fmt.format(this);
}
