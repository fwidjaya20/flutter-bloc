import 'package:bloc_test/commons/valueobjects/address.dart';
import 'package:bloc_test/domains/api/client.dart';
import 'package:bloc_test/domains/friend/model/friend_model.dart';
import 'package:dio/dio.dart';

class RequestService extends ApiClient {

  RequestService() : super("https://randomuser.me/api");

  Future<List<Person>> fetchFriendRequests() async {
    try {
      print("--> FETCH FRIEND REQUEST");

      Response response = await this.request("GET", "?results=5");

      List<Person> friendRequests = (response.data["results"] as List).map((r) {
        return Person(
          id: 0,
          name: "${r["name"]["first"]} ${r["name"]["last"]}",
          email: r["email"],
          phone: r["phone"],
          picture: r["picture"]["thumbnail"],
          address: Address(
            street: r["location"]["street"],
            city: r["location"]["city"],
            zipCode: r["location"]["postcode"].toString(),
            suite: r["location"]["state"]
          )
        );
      }).toList();

      print("<-- FRIEND REQUEST FETCHED");
      
      return friendRequests;
    } catch(e, stacktrace) {
      print("Error occured: $e, stacktrace: $stacktrace");
      return List();
    }
  }

}