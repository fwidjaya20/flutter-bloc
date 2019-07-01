import 'package:bloc_test/commons/enums/http_method.dart';
import 'package:bloc_test/domains/api/client.dart';
import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:dio/dio.dart';

class ContactService extends ApiClient {

  ContactService(): super("https://jsonplaceholder.typicode.com");

  Future<List<Person>> fetchContacts() async {
    try {
      print("--> FETCHING CONTACTS");

      Response response = await this.request(HttpMethod.GET, "users");

      List<Person> persons = (response.data as List).map((f) {
        return Person.fromJson(f);
      }).toList();

      print("<-- CONTACTS FETCHED");
      
      return persons;
    } catch(e, stacktrace) {
      print("Error occured: $e stacktrace: $stacktrace");

      return List();
    }
  }

}