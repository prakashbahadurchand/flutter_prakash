import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_prakash/core/x/ext/string_ext.dart';

Future<T> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    return await apiCall();
  } on DioException catch (e, st) {
    log("# DioException: ERROR: $e | STACKTRACE: $st");
    if (e.type == DioExceptionType.connectionTimeout) {
      throw TimeoutException('कनेक्सन समयसिमा अवस्थित भयो। कृपया पुन: प्रयास गर्नुहोस्।');
    } else if (e.type == DioExceptionType.receiveTimeout) {
      throw TimeoutException('प्राप्ति समयसिमा अवस्थित भयो। कृपया पुन: प्रयास गर्नुहोस्।');
    } else if (e.type == DioExceptionType.sendTimeout) {
      throw TimeoutException('पठाउन समयसिमा अवस्थित भयो। कृपया पुन: प्रयास गर्नुहोस्।');
    } else if (e.type == DioExceptionType.badResponse) {
      final responseBody = e.response?.data;
      if (responseBody != null) {
        responseBody.toString().toPrintPrettyJson();
        final errorMessage = responseBody['message'] ?? "सर्भरमा समस्या देखियो,\n केहि समयपछी पुन प्रयास गर्नुहोला";
        throw ServerException(message: errorMessage);
      } else {
        throw ServerException(message: "सर्भरमा समस्या देखियो,\n केहि समयपछी पुन प्रयास गर्नुहोला");
      }
    } else if (e.type == DioExceptionType.unknown) {
      throw UnknownException(message: "लोड हुन सकेन, केहि समयपछी पुन प्रयास गर्नुहोला");
    } else if (e.type == DioExceptionType.connectionError) {
      throw NoInternetException(message: "इन्टरनेट कनेक्सनमा समस्या देखियो,\n वाईफाई तथा मोबाईल डेटा चेक गर्नुहोस");
    } else if (e.type == DioExceptionType.cancel) {
      throw CancellationException(message: "रद्द गरिएको छ, पुन प्रयास गर्नुहोला");
    } else {
      throw ServerException(message: "सर्भरमा समस्या देखियो,\n केहि समयपछी पुन प्रयास गर्नुहोला");
    }
  } catch (e, st) {
    log("DioException UnknownException: $e | $st");
    throw UnknownException(message: "लोड हुन सकेन, पुन प्रयास गर्नुहोला");
  }
}

// Exception Types:

abstract class BaseException {
  final String message;
  BaseException(this.message);
}

class ServerException extends BaseException {
  ServerException({String message = "मा समस्या देखियो,\n केहि समयपछी पुन प्रयास गर्नुहोला"}) : super(message);
}

class NoInternetException extends BaseException {
  NoInternetException({String message = "इन्टरनेटमा समस्या देखियो, इन्टरनेट चेक गर्नुहोला"}) : super(message);
}

class UnauthorizedException extends BaseException {
  UnauthorizedException({String message = "तपाईलाई अनुमति दिईएको छैन, पुन प्रयास गर्नुहोला"}) : super(message);
}

class CancellationException extends BaseException {
  CancellationException({String message = "रद्द गरिएको छ, पुन प्रयास गर्नुहोला"}) : super(message);
}

class UnknownException extends BaseException {
  UnknownException({String message = "लोड हुन सकेन, पुन प्रयास गर्नुहोला"}) : super(message);
}
