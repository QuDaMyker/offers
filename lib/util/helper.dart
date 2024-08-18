import 'package:intl/intl.dart';

class Helper {
  String formatCurrency(
    double value,
    String currency, {
    String locale = 'en_US',
    bool removeDecimalDigit = true,
  }) {
    final format = NumberFormat.currency(
      locale: locale,
      symbol: currency,
      decimalDigits: removeDecimalDigit ? 0 : null,
    );
    return format.format(value);
  }

  String formatDateTimeToHHMMDdMmYyyy(DateTime date) {
    final formatter = DateFormat('hh:mm, dd-MM-yyyy');
    return formatter.format(date);
  }

  String formatDateTimeToString(DateTime dateTime) {
    final DateFormat formatter = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    return formatter.format(dateTime);
  }
}
