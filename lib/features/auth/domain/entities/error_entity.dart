class ErrorEntity {
  String? type;
  String? title;
  String? detail;
  int? status;
dynamic error;
ErrorEntity({
  required this.type,
  required this.title,
  required this.detail,
  required this.status,
  required this.error,
});
}