import 'package:intl/intl.dart';

String formatDate(String isoDate) {
  DateTime dateTime = DateTime.parse(isoDate);
  DateFormat formatter = DateFormat('MMMM d, y \'at\' h:mm a');
  return formatter.format(dateTime.toLocal());
}
