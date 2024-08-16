import 'package:short_extensions/short_extensions.dart';
import 'package:intl/intl.dart';

extension TimeComparison on TimeOfDay {
  bool isSameTime(
    TimeOfDay time,
  ) {
    // bool areTimeOfDayEqual(TimeOfDay time1)
    return time.hour == hour && time.minute == minute;
  }

  String toHourMinuteAMPM() {
    // String hmAMPMFormat()
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    final format = DateFormat.jm(); // 'jm' is for 12 hours format with AM/PM
    return format.format(dateTime);
  }

  String toHourAMPM() {
    // String hAMPMFormat()
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day, hour, minute);
    return DateFormat('hh a').format(dateTime);
  }
}

extension DateStringExtensions on String {
  TimeOfDay parseTimeOfDay(String timeStr) {
    // TimeOfDay timeOfDay(String timeString)
    try {
      String time = timeStr.substring(10, 15);

      List<String> timeParts = time.split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      return TimeOfDay.now();
    }
  }

  String dayMonthFormat() {
    // String weekdayDMFormat()
    DateTime now = DateTime.now();

    DateTime friday = now.add(Duration(days: DateTime.friday - now.weekday));
    String formattedDate = DateFormat('d MMMM').format(DateTime(2023, 9, 8));
    return weekdaysFullname[friday.weekday % 7] + ", " + formattedDate;
  }

  String extractYear() {
    // String yearFormat()
    DateTime dateTime = DateTime.parse(this);
    return dateTime.year.toString();
  }

  String toDayMonthYear() {
    // String dMYFormat()
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('d MMM y').format(dateTime);
  }

  String toHourMinute() {
    // String hmFormat()
    DateTime dateTime = DateTime.parse(this);

    int hours = dateTime.hour;
    int minutes = dateTime.minute;
    return "$hours:$minutes";
  }

  String dayMonthAbbr() {
    // String dnMFormat()
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('d\nMMM').format(dateTime);
  }

  String toHourMinSec() {
    // String timeMinSec()
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  String toDayMonthYearFormat() {
    // String ddMMMyyyyFormatt()
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  String toHourMinAMPM() {
    // String hmAMFormat()
    return DateFormat('hh:mm a').format(DateTime.parse('2012-02-27 13:27:00'));
  }

  DateTime convertToDateTime() {
    // DateTime getDateTime()
    DateTime? dateTime = DateTime.tryParse(this);
    return dateTime ?? DateTime.now();
  }
}

extension TimeStampExtensions on int {
  DateTime fromUnixTimestamp() {
    // DateTime datetimeFromTimeStamp()
    int timestamp = this;
    return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }
}

List<String> weekdays = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
];
List<String> weekdaysFullname = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

extension DateTimeExtensions on DateTime {
  String toDayMonthYearUnderscore() {
    // String dd_mm_yyyyFormat()
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    String year = this.year.toString();
    return '${day}_${month}_$year';
  }

  String toFullMonthDayYear() {
    // String mmmmDYFormat()
    String formattedDate = DateFormat('MMMM d, y').format(this);
    return formattedDate;
  }

  String toDayMonthAbbrFormat() {
    // String dMFormat()
    String formattedDate = DateFormat('dd MMM', 'en_US').format(this);
    return formattedDate;
  }

  String toDayMonthLineBreak() {
    // String dNMFormat()
    String formattedDate = DateFormat('dd MMM', 'en_US').format(this);
    formattedDate = formattedDate.replaceAll(" ", "\n");
    return formattedDate;
  }

  String toDayMonthYearSlash() {
    // String ddMMyyyyFormat()
    return DateFormat('dd/MM/yyyy').format(this);
  }

  bool isLaterDateOnly(DateTime date) {
    // bool isAfterOnlyDate(DateTime date)
    int milliseconds1 = DateTime(year, month, day).millisecondsSinceEpoch;
    int milliseconds2 =
        DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;

    // Compare the new DateTime objects
    return milliseconds1 > milliseconds2;
  }

  bool isEarlierDateOnly(DateTime date) {
    // bool isBeforeOnlyDate(DateTime date)
    return date.isLaterDateOnly(this);
  }

  bool isLaterOrSameDateOnly(DateTime date) {
    // bool isAfterOnlyDateInclusive(DateTime date)
    int milliseconds1 = DateTime(year, month, day).millisecondsSinceEpoch;
    int milliseconds2 =
        DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;

    // Compare the new DateTime objects
    return milliseconds1 >= milliseconds2;
  }

  bool isEarlierOrSameDateOnly(DateTime date) {
    // bool isBeforeOnlyDateInclusive(DateTime date)
    return date.isLaterOrSameDateOnly(this);
  }

  bool wasYesterday({
    DateTime? currentDateTime,
  }) {
    // bool checkIfYesterday({DateTime? currentDateTime})
    DateTime time = currentDateTime ?? DateTime.now();
    DateTime yesterday = time.subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool isSameDate(
    DateTime date,
  ) {
    // bool areDatesSame(DateTime date)
    return year == date.year && month == date.month && day == date.day;
  }

  bool isToday({DateTime? currentDateTime}) {
    // bool checkIfToday({DateTime? currentDateTime})
    DateTime time = currentDateTime ?? DateTime.now();

    return year == time.year && month == time.month && day == time.day;
  }

  bool isTomorrow({DateTime? currentDateTime}) {
    // bool checkIfTomorrow({DateTime? currentDateTime})
    DateTime time = currentDateTime ?? DateTime.now();

    DateTime tomorrow = time.add(Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  DateTime resetTimeToMidnight() {
    // DateTime resetTimeAndKeepDate()
    return DateTime(
      year,
      month,
      day,
      0,
      0,
      0,
    );
  }

  String toMonthYearAbbr() {
    // String monthNameYearFormat()
    return DateFormat('MMM, yyyy').format(this);
  }

  bool isCurrentDate() {
    // bool isGivenDateToday()
    DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool isWithinLastThreeDays() {
    // bool isThisWithinLastThreeDays()
    DateTime now = DateTime.now();
    Duration difference = now.difference(this);
    return difference.inDays <= 3 && difference.inDays >= 0;
  }

  String toDayWeekdayFormat() {
    // String dayAndWeekDayFormat()
    return (day.toString() + "\n" + weekdays[weekday - 1]);
  }

  String toHourMinute() {
    // String hmFormatt()
    int hours = hour;
    int minutes = minute;
    return "$hours:$minutes";
  }

  String toHourMinuteAMPM() {
    // String hmAMPMFormatt()
    int hours = hour;
    int minutes = minute;
    String AMPM = hours < 12 ? "AM" : "PM";
    return "${(hours % 12).formatAsTwoDigit()}:${minutes.formatAsTwoDigit()} $AMPM";
  }

  TimeOfDay toTimeOfDay() {
    // TimeOfDay timeOfDayFromDateTime()
    return TimeOfDay(hour: hour, minute: minute);
  }

  DateTime updateTimeOfDay(TimeOfDay timeOfDay) {
    // DateTime changeOnlyTimeForGivenTimeOfDay(TimeOfDay timeOfDay)
    return DateTime(
      year,
      month,
      day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  String toDayMonthAbbrWithTT() {
    // String dMFormattt()
    final dateFormat = DateFormat("dd MMM");
    String formattedDate = dateFormat.format(this);
    return formattedDate;
  }

  Duration timeElapsed() {
    // Duration dateDifference()
    return DateTime.now().difference(this);
  }

  String toDayMonthYearFormat() {
    // String ddMMMyyyyFormatt()
    return DateFormat('dd MMM yyyy').format(this);
  }

  String toYearMonthDayHyphen() {
    // String yMDFormat()
    DateTime d = this;
    return "${d.year}-${d.month.formatAsTwoDigit()}-${d.day.formatAsTwoDigit()}";
  }

  String toDayFullMonthYear() {
    // String dMYFormat()
    return DateFormat('d MMMM, y').format(this);
  }
}
extension TimeStringExtensions on String {
  DateTime parseToDate() {
    // DateTime dd_MM_yyyy()
    DateFormat format = DateFormat('dd_MM_yyyy');
    DateTime dateTime = format.parse(this);
    return dateTime;
  }

  String formatToGMT() {
    // String dateTimeGMT()
    return DateTime.parse(this).toHourMinuteAMPM();
  }

  String formatToZString() {
    // String dateTimeZString()
    return DateTime.parse(this).toHourMinuteAMPM();
  }

  DateTime parseToZDate() {
    // DateTime dateTimeZ()
    return DateTime.parse(this);
  }

  String describeRelativeDay() {
    // String todaytommyesterday()
    DateTime date = DateTime.parse(this);
    if (date.wasYesterday()) {
      return "Yesterday";
    } else if (date.isToday()) {
      return "Today";
    } else if (date.isTomorrow()) {
      return "Tomorrow";
    } else {
      return date.toDayMonthAbbrFormat();
    }
  }

  String toHourMinuteAMPM() {
    // String hmAMPMFormatt()
    return DateTime.parse(this).toHourMinuteAMPM();
  }

  String formatWithMonthDayTime() {
    // String formatDateWithType2()
    DateTime dateTime = DateTime.parse(this);
    String month = DateFormat.MMMM().format(dateTime);
    String day = DateFormat.d().format(dateTime);

    String hour = DateFormat.H().format(dateTime);
    String minute = DateFormat.m().format(dateTime);
    String amPm = dateTime.hour < 12 ? "AM" : "PM";

    String formattedDate = '$month $day';

    // Add suffix to day (e.g., 1st, 2nd, 3rd, 4th, etc.)
    if (day.endsWith('1') && !day.endsWith('11')) {
      formattedDate += 'st';
    } else if (day.endsWith('2') && !day.endsWith('12')) {
      formattedDate += 'nd';
    } else if (day.endsWith('3') && !day.endsWith('13')) {
      formattedDate += 'rd';
    } else {
      formattedDate += 'th';
    }

    formattedDate += ' - $hour:$minute $amPm';

    return formattedDate;
  }
}