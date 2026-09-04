import 'package:dartx/dartx.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class DateTimeUIKitUtils {
  static const String formatDateConst = 'dd/MM/yyyy';
  static const String formatDateToDatabase = 'yyyy-MM-dd';
  static const String formatDateToDatabaseReversed = 'dd-MM-yyyy';
  static const String formatDateTimeConst = 'dd/MM/yyyy HH:mm';
  static const String formatTimeConst = 'HH:mm';
  static const String formatTimeDateConst = 'HH:mm dd/MM/yyyy';
  static const String formatTimeDateBreakLineConst = 'HH:mm\ndd/MM';
  static const String formatDateNoYearConst = 'dd/MM';
  static const String formatTimeDateNoYearConst = 'HH:mm dd/MM';
  static const String formatDateTextConst = 'dd MMM, yy';

  static String formatDateTime(
    DateTime? dateTime, {
    String formatDisplay = formatDateConst,
  }) {
    if (dateTime == null) {
      return '';
    }

    return DateFormat(formatDisplay).format(dateTime).toString();
  }
  
   static String formatTime(DateTime? dateTime) {
    if (dateTime == null) return '';
    return DateFormat(formatTimeConst).format(dateTime);
  }

  static String formatFromDateTimeString(
    String? dateTimeString, {
    String formatDisplay = formatDateConst,
  }) {
    if (dateTimeString == null) {
      return '';
    }

    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime == null) {
      return '';
    }

    return DateFormat(formatDisplay).format(dateTime).toString();
  }

  static DateTime getDayWithNoTime(DateTime? datetime) {
    if (datetime == null) {
      return DateTime(1970, 01, 01);
    }

    return DateTime(datetime.year, datetime.month, datetime.day);
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);

    return (to.difference(from).inHours / 24).round();
  }

  static int timezoneOffset() {
    return DateTime.now().timeZoneOffset.inHours;
  }

  static DateTime toLocalFromTimestamp({required int utcTimestampMillis}) {
    return DateTime.fromMillisecondsSinceEpoch(utcTimestampMillis, isUtc: true)
        .toLocal();
  }

  static DateTime toLocalDateTime({required DateTime utcDateTime}) {
    return utcDateTime.toLocal();
  }

  static DateTime toUtcFromTimestamp(int localTimestampMillis) {
    return DateTime.fromMillisecondsSinceEpoch(localTimestampMillis,
            isUtc: false)
        .toUtc();
  }

  static DateTime startTimeOfDate() {
    final now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
    );
  }

  static DateTime? toDateTime(String dateTimeString, {bool isUtc = false}) {
    final dateTime = DateTime.tryParse(dateTimeString);
    if (dateTime != null) {
      if (isUtc) {
        return DateTime.utc(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond,
        );
      }

      return dateTime;
    }

    return null;
  }

  static DateTime? toNormalizeDateTime(String dateTimeString,
      {bool isUtc = false}) {
    final dateTime = DateTime.tryParse('-123450101 $dateTimeString');
    if (dateTime != null) {
      if (isUtc) {
        return DateTime.utc(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond,
        );
      }

      return dateTime;
    }

    return null;
  }

  static DateTime? tryParse({
    String? date,
    String? format,
    String locale = 'vi',
  }) {
    if (date == null) {
      return null;
    }

    if (format == null) {
      return DateTime.tryParse(date);
    }

    final DateFormat dateFormat = DateFormat(format, locale);
    try {
      return dateFormat.parse(date);
    } catch (e) {
      return null;
    }
  }

  static int dtToUnix(DateTime? dt) {
    if (dt == null) {
      return 0;
    }

    return dt.millisecondsSinceEpoch ~/ 1000;
  }

  static DateTime? unixToDateTime(int? unix) {
    if (unix == null || unix <= 0) {
      return null;
    }

    return DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  }

  static int dateDiffToSeconds(DateTime date1, DateTime date2) {
    return date1.difference(date2).inSeconds;
  }

  static String? parseTime(String? timeString) {
    if (timeString != null) {
      final List<String> parts = timeString.split(':');
      if (parts.length >= 2) {
        final hours = int.tryParse(parts[0]) ?? 0;
        final minutes = int.tryParse(parts[1]) ?? 0;

        // Format hours and minutes with leading zeros if needed
        final formattedHours = hours.toString().padLeft(2, '0');
        final formattedMinutes = minutes.toString().padLeft(2, '0');

        return '$formattedHours:$formattedMinutes';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

extension DateTimeExtensions on DateTime {
  String toStringWithFormat(String format) {
    return DateFormat(format).format(this);
  }

  DateTime get lastDateOfMonth {
    return DateTime(year, month + 1, 0);
  }

  Map<String, tz.Location> get getTimeZoneDatabase {
    tz.initializeTimeZones();

    return tz.timeZoneDatabase.locations;
  }

  int _getESTtoUTCDifference(String locationName) {
    tz.initializeTimeZones();
    final locationNY = tz.getLocation(locationName);
    final tz.TZDateTime nowNY = tz.TZDateTime.now(locationNY);

    return nowNY.timeZoneOffset.inHours;
  }

  DateTime toESTzone(String locationName) {
    DateTime result = toUtc(); // local time to UTC
    result = result.add(Duration(
        hours: _getESTtoUTCDifference(locationName))); // convert UTC to EST

    return result;
  }

  DateTime fromESTzone(String locationName) {
    DateTime result = subtract(Duration(
      hours: _getESTtoUTCDifference(locationName),
    )); // convert EST to UTC

    String dateTimeAsIso8601String = result.toIso8601String();
    dateTimeAsIso8601String +=
        dateTimeAsIso8601String.characters.last.toLowerCase() == 'z' ? '' : 'Z';
    result = DateTime.parse(dateTimeAsIso8601String); // make isUtc to be true

    result = result.toLocal(); // convert UTC to local time

    return result;
  }

  DateTime withoutTime() {
    return DateTime(year, month, day);
  }

  /// Function to get the difference between two dates without specified holidays
  /// e.g holidays = [DateTime.saturday, DateTime.sunday]
  Duration differenceWithout(DateTime other, {List<int> holidays = const []}) {
    DateTime start = isBefore(other) ? this : other;
    DateTime end = isBefore(other) ? other : this;
    Duration difference = end.difference(start);
    while (end.difference(start).inDays > 0) {
      if (holidays.contains(start.weekday)) {
        difference -= const Duration(days: 1);
      }
      start = start.add(const Duration(days: 1));
    }
    return difference;
  }
}

/// Convert [value] to [DateTime] with format [DateTimeFormatConstants.appServerResponse]
DateTime? timezoneDate(dynamic value) {
  if (value == null) {
    return null;
  }

  return DateFormat('yyyy-MM-ddTHH:mm').parse(value);
}

extension DurationExtension on Duration {
  String toFormattedString(String formatter) {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);

    return formatter
        .replaceAll('HH', hours.toString())
        .replaceAll('mm', minutes.toString().padLeft(2, '0'))
        .replaceAll('ss', seconds.toString().padLeft(2, '0'));
  }
}
