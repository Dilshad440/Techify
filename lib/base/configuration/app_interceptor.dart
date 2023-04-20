import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:techify_assesment/constant/api_constant.dart';

class AppInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters.addAll({'apiKey': ApiConstant.apiKey});
    debugPrint("### Request -${options.queryParameters.toString()}");
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint("###- Error - ${err.error}");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("### Response - ${response.data}");
    super.onResponse(response, handler);
  }
}
