import 'package:intl/intl.dart';

extension NumExtension on num {
  String get idr {
    var format = NumberFormat("#,##0", "en_US");
    return format.format(this);
  }
}
