import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class MyHelper {
  static String formatCurrency(double number) {
    final NumberFormat fmt = NumberFormat.currency(locale: 'id', symbol: '');
    String s = fmt.format(number);
    String format = s.toString().replaceAll(RegExp(r"([,]*00)(?!.*\d)"), "");
    return format;
  }

  static String formatDate(DateTime dateTime) {
    initializeDateFormatting("id");
    return DateFormat.yMMMMEEEEd("id").format(dateTime);
  }
}
