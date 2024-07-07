import 'package:dio/dio.dart';

sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(
    this.value, {
    this.statusCode,
    this.message,
  });

  final T value;
  final int? statusCode;
  final String? message;
}

final class Failure<T> extends Result<T> {
  const Failure(
    this.exception, {
    this.statusCode,
    this.message,
  });

  final Exception exception;
  final int? statusCode;
  final String? message;
}

abstract class ApiResultHandler<T> {
  static Future<Result<T>> guard<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Success(result);
    } catch (e) {
      if (e is DioException) {
        throw Failure(
          e,
          statusCode: e.response?.statusCode,
          message: e.response?.data['message'] ?? e.message,
        );
      } else {
        throw Failure(
          Exception('Unexpected error'),
          message: e.toString(),
        );
      }
    }
  }
}
