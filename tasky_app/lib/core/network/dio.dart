import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasky_app/config/config.dart';

part 'dio.g.dart';

@Riverpod(keepAlive: true)
Dio dio(DioRef ref) {
  final dio = Dio();

  dio.options.baseUrl = Config.current().baseUrl;
  dio.options.headers = {
    'Content-Type': 'application/json',
  };

  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.addAll(
    [
      LogInterceptor(),
    ],
  );

  return dio;
}
