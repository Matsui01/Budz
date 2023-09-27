import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/resources/api_error.dart';
import '../../../utils/resources/api_response.dart';

abstract class BaseApiRepository {
  @protected
  Future<ApiResponse<T>> getResponse<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return ApiSuccess(httpResponse.data);
      } else {
        throw DioException(
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        );
      }
    } on DioException catch (e) {
      return ApiError(AppError(
        code: e.response?.statusCode ?? -1,
        message: e.message,
      ));
    }
  }
}
