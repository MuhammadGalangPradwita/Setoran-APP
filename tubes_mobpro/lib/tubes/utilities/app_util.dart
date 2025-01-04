import 'package:intl/intl.dart';

class AppUtil {
  static String formatPrice(int price) {
    final formatter = NumberFormat('#,###');
    return 'Rp${formatter.format(price)}';
  }

  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }
}
