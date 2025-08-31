import 'package:intl/intl.dart';

class DateConverter {
  static String formatDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
  }

  static String isoToFormattedString(String isoString) {
    if(isoString.isEmpty) return '';

    final dateTime = DateTime.parse(isoString);
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

}
