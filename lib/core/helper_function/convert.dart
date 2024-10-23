import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:attendance_and_departure/features/language/presentation/provider/language_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import 'package:time_machine/time_machine.dart' as time;

//Jan 1, 2024 12:00 AM
String convertDateTimeToString(DateTime dateTime) {
  return DateFormat(
          'التاريخ :  MMM d, y  الساعة : hh:mm a',
          Provider.of<LanguageProvider>(Constants.globalContext(),
                  listen: false)
              .appLocal
              .languageCode)
      .format(dateTime);
}
DateTime? convertDateTime(dynamic data){
if(data!=null){
return DateTime.parse(data);
}
}
String convertDateToTime(DateTime dateTime) {
  return DateFormat(
          'hh:mm a',
          Provider.of<LanguageProvider>(Constants.globalContext(),
                  listen: false)
              .appLocal
              .languageCode)
      .format(dateTime);
}

//2024-04-15
String convertDateToStrinattendance_and_departureD(DateTime dateTime) {
  return DateFormat('yyyy-M-d', 'en').format(dateTime);
}

String checkDateIfNull(dynamic dateTime) {
  return dateTime == "null" || dateTime == null
      ? ""
      : DateFormat(
              'MMM d, y hh:mm a',
              Provider.of<LanguageProvider>(Constants.globalContext(),
                      listen: false)
                  .appLocal
                  .languageCode)
          .format(DateTime.parse(dateTime));
}

//31-3-2024
String convertDateToStringDMY(DateTime dateTime) {
  // Extract the date components
  final day = dateTime.day.toString().padLeft(2, '0');
  final month = dateTime.month.toString().padLeft(2, '0');
  final year = dateTime.year.toString();

  // Concatenate the components with the desired format
  return '$day/$month/$year';
}

// sunday
String getDayNameFromDate(DateTime dateTime) {
  return DateFormat(
          'EEEE',
          Provider.of<LanguageProvider>(Constants.globalContext(),
                  listen: false)
              .appLocal
              .languageCode)
      .format(dateTime);
}

//Apr 15, 2024
String convertDateToString(DateTime dateTime) {
  return DateFormat(
          'MMM d, y',
          Provider.of<LanguageProvider>(Constants.globalContext(),
                  listen: false)
              .appLocal
              .languageCode)
      .format(dateTime);
}

// 15 Apr 2024
String convertDateToStringDMMMY(DateTime dateTime) {
  return DateFormat(
          'd MMM y',
          Provider.of<LanguageProvider>(Constants.globalContext(),
                  listen: false)
              .appLocal
              .languageCode)
      .format(dateTime);
}

int convertStringToInt(dynamic value) {
  if (value == null) {
    return 0;
  } else if (value is int) {
    return value;
  } else if (int.tryParse(value) != null) {
    return int.parse(value);
  }
  return 0;
}

num? convertDataToNum(dynamic value) {
  if (value == null) {
    return null;
  } else if (value is num) {
    return value;
  } else if (num.tryParse(value) != null) {
    return num.parse(value);
  }
  return 0;
}

double convertDataToDouble(dynamic value) {
  if (value == null) {
    return 0;
  } else if (value is int) {
    return value.toDouble();
  } else if (value is String) {
    return double.parse(value);
  } else {
    return value;
  }
}

String convertMapToString(Map data) {
  String msg = '';
  data.forEach((key, value) {
    if (value is List) {
      msg += value.join('\n');
      msg += "\n";
    } else if (value is String) {
      msg += "$value\n";
    }
  });
  if (msg.endsWith('\n')) {
    msg = msg.substring(0, msg.length - 1);
  }
  return msg;
}

bool convertDataToBool(dynamic data) {
  if (data == null) {
    return false;
  } else if (data is num) {
    return data == 1;
  } else if (data is String) {
    if (int.tryParse(data) == null) {
      return data == 'yes';
    }
    return convertStringToInt(data) == 1;
  } else {
    return data;
  }
}

Map convertStringToMap(String data) {
  String jsonString = data
      .replaceAll('{', '{"')
      .replaceAll('}', '"}')
      .replaceAll('=', '":"')
      .replaceAll(', ', '","');
  return jsonDecode(jsonString);
}

String convertSecToMin(int sec) {
  int minutes = sec ~/ 60;
  int seconds = sec % 60;

  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}

String getDiffTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  time.LocalDate a = time.LocalDate.dateTime(dateTime);
  time.LocalDate b = time.LocalDate.dateTime(now);

  time.Period diff = b.periodSince(a);
  int years = diff.years;
  // years = now.year-noti.year;
  int month = 0;
  if (years == 0) {
    // month = now.month-noti.month;
    month = diff.months;
  }
  int days = 0;
  if (years == 0 && month == 0) {
    days = diff.days;
  }
  int hours = 0;
  if (days == 0 && years == 0 && month == 0) {
    hours = now.hour - dateTime.hour;
  }
  int min = 0;
  if (hours == 0 && days == 0 && years == 0 && month == 0) {
    min = now.minute - dateTime.minute;
  }
  int sec = 0;
  if (min == 0 && hours == 0 && days == 0 && years == 0 && month == 0) {
    sec = now.second - dateTime.second;
  }
  return '${LanguageProvider.translate('time', 'ago')} ${getTimeNumber(years, month, days, hours, min, sec)}${getTimeChar(years, month, days, hours, min, sec)}';
}

String getTimeNumber(int year, int month, int day, int h, int m, int s) {
  if (year != 0) {
    return '$year';
  } else if (month != 0) {
    return '$month';
  } else if (day != 0) {
    return '$day';
  } else if (h != 0) {
    return '$h';
  } else if (m != 0) {
    return '$m';
  } else if (s != 0) {
    return '$s';
  }
  return '';
}

String getTimeChar(int year, int month, int day, int h, int m, int s) {
  if (year != 0) {
    return LanguageProvider.translate('time', 'year');
  } else if (month != 0) {
    return LanguageProvider.translate('time', 'month');
  } else if (day != 0) {
    return LanguageProvider.translate('time', 'day');
  } else if (h != 0) {
    return LanguageProvider.translate('time', 'hour');
  } else if (m != 0) {
    return LanguageProvider.translate('time', 'min');
  } else if (s != 0) {
    return LanguageProvider.translate('time', 'sec');
  }
  return '';
}
String getMediaType(String url) {
  if (url.endsWith('.mp4') || url.endsWith('.avi') || url.endsWith('.mov')) {
    return 'video';
  } else if (url.endsWith('.jpg') || url.endsWith('.png') || url.endsWith('.gif')) {
    return 'image';
  } else if (url.endsWith('.mp3') || url.endsWith('.wav')) {
    return 'audio';
  } else {
    // Default to unknown type or handle other types as needed
    return url;
  }
}

double convertRgbToHue(int color) {
  int red = (color >> 16) & 0xff;
  int green = (color >> 8) & 0xff;
  int blue = color & 0xff;

  double r = red / 255.0;
  double g = green / 255.0;
  double b = blue / 255.0;

  double max = r > g ? (r > b ? r : b) : (g > b ? g : b);
  double min = r < g ? (r < b ? r : b) : (g < b ? g : b);

  double hue;
  double saturation;
  double lightness = (max + min) / 2.0;

  if (max == min) {
    hue = 0.0; // achromatic
  } else {
    double d = max - min;
    saturation = lightness > 0.5 ? d / (2.0 - max - min) : d / (max + min);
    if (max == r) {
      hue = (g - b) / d + (g < b ? 6.0 : 0.0);
    } else if (max == g) {
      hue = (b - r) / d + 2.0;
    } else {
      hue = (r - g) / d + 4.0;
    }
    hue /= 6.0;
  }

  // Scale hue to the range [0, 360]
  return hue * 360.0;
}

String formatNumber(int number) {
  if (number >= 1000000) {
    double result = number / 1000000;
    return '${result.toStringAsFixed(1)}M';
  } else if (number >= 1000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(1)}K';
  } else {
    return number.toString();
  }
}

String formatTimeToAm(DateTime dateTime) {
  // Create a formatter for the time pattern
  final timeFormatter = DateFormat(
      'h:mm a',
      Provider.of<LanguageProvider>(Constants.globalContext())
          .appLocal
          .languageCode);

  // Format the DateTime object to a string
  return timeFormatter.format(dateTime);
}

Color hexToColor(String code) {
  if (int.tryParse('0xFF$code') != null) {
    return Color(int.parse('0xFF$code'));
  }
  return Color(int.parse('0xFF${Constants.mainColor}'));
}
