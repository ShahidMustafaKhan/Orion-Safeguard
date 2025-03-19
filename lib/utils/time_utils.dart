import 'package:intl/intl.dart';

String formatTo24HourTime(DateTime? dateTime) {
  if (dateTime == null) return '';
  DateTime localTime = dateTime.toLocal(); // Convert to local time
  return "${localTime.hour.toString().padLeft(2, '0')}:${localTime.minute.toString().padLeft(2, '0')}";
}

String changeDateTimeFormat(DateTime inputDateTime, String format) {
  DateTime dateTime = inputDateTime.toLocal();
  return DateFormat(format).format(dateTime);
}

String formatDateTime(DateTime? dateTime, {bool showYear = false}) {
  if (dateTime == null) return '';
  dateTime = dateTime.toLocal();

  final format = showYear ? "MMM d yyyy, hh:mm a" : "MMM d, hh:mm a";
  final formattedDate = DateFormat(format).format(dateTime);

  return formattedDate.toUpperCase(); // Ensures "AM/PM" is uppercase
}

String timeDifference(DateTime? startDate, DateTime? endDate) {
  if (startDate == null || endDate == null) return '';

  Duration diff = endDate.difference(startDate);

  if (diff.inSeconds < 60) {
    return '${diff.inSeconds} sec';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} min';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hours';
  } else {
    return '${diff.inDays} days';
  }
}

String formatDateTimeRange(DateTime? start, DateTime? end) {
  if (start == null || end == null) return '';

  start = start.toLocal();
  end = end.toLocal();

  final dateFormat = DateFormat("MMM d");
  final timeFormat = DateFormat("HH:mm");

  String startDate = dateFormat.format(start);
  String startTime = timeFormat.format(start);
  String endDate = dateFormat.format(end);
  String endTime = timeFormat.format(end);

  if (startDate == endDate) {
    return "$startDate, $startTime - $endTime";
  } else {
    return "$startDate, $startTime - $endDate, $endTime";
  }
}

String timeDifferenceTillNow(DateTime? fromTime, DateTime? now,
    {bool showAsClockFormat = false, showSeconds = false}) {
  if (fromTime == null || now == null) return '';

  Duration difference = fromTime.difference(now);

  fromTime = fromTime.toLocal();

  if (difference.isNegative) {
    return showAsClockFormat ? "00:00:00" : "0 Minutes"; // Handle past times
  }

  int hours = difference.inHours;
  int minutes = (difference.inMinutes % 60);
  int seconds = (difference.inSeconds % 60);

  if (showAsClockFormat) {
    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  } else {
    if (hours == 0) {
      return showSeconds
          ? "$minutes Min $seconds Seconds"
          : "$minutes Minutes"; // Only minutes if no hours
    } else {
      return showSeconds
          ? "$hours Hours $minutes Min"
          : "$hours Hours $minutes Minutes"; // Full format
    }
  }
}

String timeLeftUntil(DateTime toTime, DateTime now,
    {bool showAsClockFormat = false}) {
  toTime = toTime.toLocal();

  Duration difference = toTime.difference(now);

  if (difference.isNegative) {
    return showAsClockFormat ? "00:00:00" : "0 Minutes"; // Handle past times
  }

  int hours = difference.inHours;
  int minutes = (difference.inMinutes % 60);
  int seconds = (difference.inSeconds % 60);

  if (showAsClockFormat) {
    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  } else {
    if (hours == 0) {
      return "$minutes Minutes"; // Only minutes if no hours
    } else {
      return "$hours Hours $minutes Minutes"; // Full format
    }
  }
}

String timeAddedToNow(DateTime fromTime, DateTime now,
    {bool showAsClockFormat = false}) {
  fromTime = fromTime.toLocal();
  Duration difference = now.difference(fromTime);
  DateTime addedTime = now.add(difference);

  int days = addedTime.difference(now).inDays;
  int hours = addedTime.difference(now).inHours % 24;
  int minutes = addedTime.difference(now).inMinutes % 60;
  int seconds = addedTime.difference(now).inSeconds % 60;

  if (showAsClockFormat) {
    return "${hours.toString().padLeft(2, '0')}:"
        "${minutes.toString().padLeft(2, '0')}:"
        "${seconds.toString().padLeft(2, '0')}";
  } else {
    if (days > 0) {
      return "$days Days $hours Hours from now";
    } else if (hours > 0) {
      return "$hours Hours $minutes Minutes from now";
    } else if (minutes > 0) {
      return "$minutes Minutes from now";
    } else {
      return "$seconds Seconds from now";
    }
  }
}

String formatDateTimeIn12HourFormat(DateTime? dateTime) {
  if (dateTime == null) return "Invalid Date"; // Handle null check
  dateTime = dateTime.toLocal();
  DateTime now = DateTime.now();
  bool isSameDay = now.year == dateTime.year &&
      now.month == dateTime.month &&
      now.day == dateTime.day;

  if (isSameDay) {
    return DateFormat("hh:mm a").format(dateTime); // e.g., "10:00 AM"
  } else {
    return DateFormat("MMM dd, hh:mm a")
        .format(dateTime); // e.g., "Mar 12, 02:30 AM"
  }
}

DateTime currentTime() {
  return DateTime.now().toUtc();
}

bool isDatePassed(DateTime? date) {
  if (date == null) return false;
  date = date.toLocal();
  DateTime now = DateTime.now();
  return now.isAfter(date) || now.isAtSameMomentAs(date);
}

bool isDatePassedNotReached(DateTime? date) {
  if (date == null) return false;
  date = date.toLocal();
  DateTime now = DateTime.now();
  return now.isBefore(date);
}

String timeAgo(DateTime? dateTime) {
  if (dateTime == null) return '';
  final Duration difference = DateTime.now().difference(dateTime);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds} sec';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} min';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()} weeks';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()} months';
  } else {
    return '${(difference.inDays / 365).floor()} years';
  }
}
