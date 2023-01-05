import 'package:calendz_app/common/error/app_exception.dart';

class FetchDataException extends AppException {
  FetchDataException({required String? message, int? statusCode})
      : super(
            statusCode: statusCode,
            message: message,
            prefix: "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException({required String? message, int? statusCode})
      : super(
            statusCode: (statusCode != null) ? statusCode : 400,
            message: message,
            prefix: "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException({required String? message})
      : super(statusCode: 401, message: message, prefix: "Unauthorised: ");
}

class PaymentRequiredException extends AppException {
  PaymentRequiredException({required String? message})
      : super(statusCode: 402, message: message, prefix: "Payment required: ");
}

class ForbiddenException extends AppException {
  ForbiddenException({required String? message})
      : super(statusCode: 403, message: message, prefix: "Forbidden: ");
}

class NotFoundException extends AppException {
  NotFoundException({required String? message})
      : super(statusCode: 404, message: message, prefix: "Not found: ");
}

class ConflictException extends AppException {
  ConflictException({required String? message})
      : super(statusCode: 409, message: message, prefix: "Conflict: ");
}

class ServerException extends AppException {
  ServerException({required String? message, int? statusCode})
      : super(
            statusCode: (statusCode != null) ? statusCode : 500,
            message: message,
            prefix: "Internal server error: ");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String? message})
      : super(message: message, prefix: "Invalid Input: ");
}
