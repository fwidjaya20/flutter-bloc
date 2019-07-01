import 'package:bloc_test/commons/valueobjects/address.dart';

class Person {
  final int id;
  final String name;
  final String email;
  final Address address;
  final String phone;
  final String picture;

  Person({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phone,
    this.picture
  });

  Person.fromJson(Map<String, dynamic> json) :
    id = json["id"],
    name = json["name"],
    email = json["email"],
    address = Address.fromJson(json["address"]),
    phone = json["phone"],
    picture = json["picture"] ?? "https://via.placeholder.com/150";
}