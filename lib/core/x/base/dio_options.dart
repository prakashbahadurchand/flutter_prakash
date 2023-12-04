import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dioOptions = Dio(BaseOptions(contentType: "application/json"));

Dio buildDioClient(String? authToken) {
  BaseOptions options = (authToken != null)
      ? BaseOptions(
    contentType: "application/json",
    headers: {
      "Authorization": "Bearer $authToken",
    }
  )
      : BaseOptions(contentType: "application/json");

  Dio dio = Dio(options);
  dio.options.followRedirects = true;

  // Create a Logger instance for HTTP logging
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));

  return dio;
}