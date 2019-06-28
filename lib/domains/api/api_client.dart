import 'package:dio/dio.dart';

class ApiClient {

  final String baseEndpoint;
  Dio dio;

  ApiClient(this.baseEndpoint) {
    dio = new Dio();

    this.setInterceptors();
  }

  setInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:(RequestOptions options){
          options.headers["Content-Type"] = "application/json";
          options.headers["Authorization"] = "";

          return options;
        },
        onResponse:(Response response) {
          return response;
        },
        onError: (DioError e) {
          return e;
        }
      )
    );
  }

  request<T>(String method, String url, { dynamic data }) {

    if (!(method is String)) {
      throw("Method must be String Type!");
    }

    if (!(url is String)) {
      throw("Url must be String Type!");
    }

    return dio.request<T>(
      "$baseEndpoint/$url",
      data: data,
      options: Options(
        method: method,
        responseType: ResponseType.json
      ),
    );

  }

}