// ignore_for_file: only_throw_errors

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
    super.statusCode,
    this.title,
    super.message,
  }) : super(
          value: null,
        );

  final Exception exception;
  final String? title;
}

abstract class ApiResultHandler<T> {
  static Future<Result<T>> guard<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final result = await operation();
      return Success(result);
    } on DioException catch (e) {
      String? errorMessage;
      String? errorTitle;

      if (e.response?.data is Map<String, dynamic>) {
        errorMessage =
            (e.response?.data as Map<String, dynamic>)['message'] as String?;
        errorTitle =
            (e.response?.data as Map<String, dynamic>)['title'] as String?;
      }

      throw Failure(
        e,
        statusCode: e.response?.statusCode,
        message: errorMessage,
        title: errorTitle,
      );
    } on Exception catch (e) {
      throw Failure(
        Exception('Unexpected error'),
        message: e.toString(),
      );
    }
  }
}
