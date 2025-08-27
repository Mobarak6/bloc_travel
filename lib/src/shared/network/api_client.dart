import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static Dio get instance {
    final dio = Dio(
      BaseOptions(
        contentType: Headers.jsonContentType,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    ]);

    return dio;
  }
}
