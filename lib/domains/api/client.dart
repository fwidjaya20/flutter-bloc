import 'package:dio/dio.dart';

class ApiClient {
  final String baseEndpoint;
  Dio _dio;

  ApiClient(this.baseEndpoint) {
    _dio = Dio();

    _setInterceptors();
  }

  _setInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options) {
          return options;
        },
        onResponse: (Response response) {
          return response;
        },
        onError: (DioError error) {
          return error;
        }
      )
    );
  }

  request<T>(String method, String url, { dynamic data }) {
    if (!(method is String)) {
      throw("Method must be String format!");
    }

    if (!(url is String)) {
      throw("Url must be String format!");
    }

    return _dio.request<T>(
      "$baseEndpoint/$url",
      data: data,
      options: Options(
        method: method,
        responseType: ResponseType.json
      )
    );
  }
}