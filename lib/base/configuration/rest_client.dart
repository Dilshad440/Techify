import 'package:dio/dio.dart';
import 'package:techify_assesment/base/configuration/app_interceptor.dart';
import 'package:techify_assesment/constant/api_constant.dart';

class RestClient {
  late Dio dio;

  RestClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        connectTimeout: const Duration(seconds: 50000),
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.addAll([
      AppInterceptor(),
    ]);
  }
}
