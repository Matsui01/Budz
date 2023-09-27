import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // var token = Authentication().token;
    // token ??= await TokenStorage.loadToken();

    // if (token != null) {
    //   options.headers['Authorization'] = token.authorization;
    // }

    super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // if (err.response?.statusCode == 401) {
    //   final token = Authentication().token;
    //   if (token != null) {
    //     ApiResponse<Token> response = await getIt<ProfileRepository>().refreshToken(token);

    //     if (response is ApiSuccess) {
    //       err.requestOptions.headers['Authorization'] = response.data?.authorization;
    //     }
    //   }

    //   // Repeat the request with the updated header
    //   return handler.resolve(await getIt<Dio>().fetch(err.requestOptions));
    // }
    return handler.next(err);
    // super.onError(e, handler);
  }
}
