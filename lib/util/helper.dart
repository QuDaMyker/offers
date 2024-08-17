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
}
