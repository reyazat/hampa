import 'package:dio/dio.dart';
import 'package:fitness/network/network_exceptions.dart';
import 'package:fitness/services/show_message_service.dart';
import 'package:fitness/values/parameters.dart';

class DioClient {
  Dio? _dio;
  static final DioClient _instance = DioClient._internal();

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {

    _dio = Dio()
      ..options.connectTimeout = 20000
      ..options.receiveTimeout = 10000
      ..options.receiveDataWhenStatusError = true
      ..httpClientAdapter
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

    _dio?.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          // Do something before request is sent
          return handler.next(options); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onResponse: (response, handler) {
          // Do something with response data
          return handler.next(response); // continue
          // If you want to reject the request with a error message,
          // you can reject a `DioError` object eg: return `dio.reject(dioError)`
        },
        onError: (DioError e, handler) {
          ShowMessageService.showErrorMsg(NetworkExceptions.getErrorMessage(e));
          return handler.next(e); //continue
          // If you want to resolve the request with some custom data，
          // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        }
    ));

    if (Parameters.logInterceptor == true) {
      _dio?.interceptors.add(
        LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true
        )
      );
    }
  }

  Dio getDio() {
    return _dio ?? Dio();
  }

}