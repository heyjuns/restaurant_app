import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    final now = DateTime.now();
    final dateFormat = DateFormat('y/M/d');
    const specificTime = "11:00:00";
    final completeFormat = DateFormat('y/M/d H:m:s');

    final todayDate = dateFormat.format(now);
    final todayDateAndTime = "$todayDate $specificTime";
    final resultToday = completeFormat.parseStrict(todayDateAndTime);

    final formatted = resultToday.add(const Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $specificTime";
    final resultTomorrow = completeFormat.parseStrict(tomorrowDateAndTime);

    final result = now.isAfter(resultToday) ? resultTomorrow : resultToday;
    print(result);
    return result;
  }
}
