import 'package:crypto_mobile/core/services/utils/http_Utils/https_utils.dart';
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    err = await HttpUtils.buildErrorResponse(err);
    return super.onError(err, handler);
  }
}
