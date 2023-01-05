class AppException implements Exception {
  final String? message;
  final String prefix;
  final int? statusCode;

  AppException({required this.message, required this.prefix, this.statusCode});

  String toString() {
    return "$prefix$message";
  }
}
