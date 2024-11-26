String convertToHoursAndMinutes(int totalMinutes) {
  int hours = totalMinutes ~/ 60; // حساب عدد الساعات
  int minutes = totalMinutes % 60;
  String show = hours > 0 ? 'ساعة' : 'دقيقة'; // حساب عدد الدقائق المتبقية
  return "$hours:${minutes.toString().padLeft(2, '0')}" + " " + show; // تنسيق النتيجة
}

String convertToHoursAndMinutesString(String inputs) {
  List<String> parts = inputs.split('.');
  int days = int.parse(parts[0]);
  String timePart = parts[1];
  List<String> timeParts = timePart.split(':');
  int hours = int.parse(timeParts[0]);
  int minutes = int.parse(timeParts[1]);
  // Convert days to hours and add to the total hours
  int totalHours = days * 24 + hours;
  late String result;
  // Check for negative values
  if (totalHours < 0 || minutes < 0) {
    totalHours = totalHours.abs();
    minutes = minutes.abs();
    result = '0 ساعة';
    print("Negative time: -${totalHours}h ${minutes}m");
  } else {
    result = "${hours == 0 ? 12 : hours}:${minutes} ساعة ";
  } // حساب عدد الدقائق

  return result; // تنسيق النتيجة
}

String convertToHoursAndMinutesStringWork(String inputs) {
  List<String> parts = inputs.split(':'); // حساب عدد الساعات
  int hours = int.parse(parts[0]); // Hours part
  int minutes = int.parse(parts[1]); // حساب عدد الدقائق
  String result = "$hours:$minutes" + " ساعة";
  return result; // تنسيق النتيجة
}

String toDisplayFormat(String? timeSpan) {
  if (timeSpan == null || timeSpan.isEmpty) return '';

  final cleanValue = timeSpan.replaceAll('\\', '');
  final parts = cleanValue.split(':');
  if (parts.length < 2) return '';

  final hours = int.tryParse(parts[0]) ?? -1;
  final minutes = int.tryParse(parts[1]) ?? -1;

  if (hours < 0 || minutes < 0) return '';

  final period = hours >= 12 ? 'PM' : 'AM';
  final displayHours = hours % 12 == 0 ? 12 : hours % 12;
  final displayMinutes = minutes.toString().padLeft(2, '0');

  return '$displayHours:$displayMinutes $period';
}
