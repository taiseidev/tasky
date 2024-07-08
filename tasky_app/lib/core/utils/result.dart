import 'package:dio/dio.dart';

sealed class Result<T> {
  const Result({
    this.value,
    this.statusCode,
    this.message,
  });

  final T? value;
  final int? statusCode;
  final String? message;
}

final class Success<T> extends Result<T> {
  const Success(T? value) : super(value: value);
}

final class Failure<T> extends Result<T> {
  const Failure(
    this.exception, {
    int? statusCode,
    String? message,
  }) : super(
          statusCode: statusCode,
          message: message,
          value: null,
        );

  final Exception exception;
}

abstract class ApiResultHandler<T> {
  static Future<Result<T>> guard<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Success(result);
    } on DioException catch (e) {
      return Failure(
        e,
        statusCode: e.response?.statusCode,
        message: e.response?.data['message'] ?? e.message,
      );
    } on Exception catch (e) {
      return Failure(
        Exception('Unexpected error'),
        message: e.toString(),
      );
    }
  }
}
