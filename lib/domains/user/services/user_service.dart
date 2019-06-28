import 'package:bloc_test/commons/enums/http_method.dart';
import 'package:bloc_test/domains/api/api_client.dart';
import 'package:bloc_test/domains/user/responses/user_response.dart';
import 'package:dio/dio.dart';

class UserService extends ApiClient {

  UserService() : super("https://randomuser.me/api");

  Future<UserResponse> getUser() async {
    try {
      Response response = await this.request(HttpMethod.GET, "/?results=1");

      return UserResponse.fromJson(response.data);
    } catch(e, stacktrace) {
      print("Exception occured: $e stackTrace: $stacktrace");
      return UserResponse.withError(e);
    }
  }

  Future<UserResponse> getUsers() async {
    try {
      Response response = await this.request(HttpMethod.GET, "/?results=100");

      return UserResponse.fromJson(response.data);
    } catch(e, stacktrace) {
      print("Exception occured: $e stackTrace: $stacktrace");
      return UserResponse.withError(e);
    }
  }

}