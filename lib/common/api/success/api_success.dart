class ApiSuccess {
  static const OK = 200;
  static const CREATED = 201;
  static const NOCONTENT = 204;
  final int statusCode;
  final String? message;
  final dynamic content;

  ApiSuccess({required this.statusCode, this.message, this.content});
}
