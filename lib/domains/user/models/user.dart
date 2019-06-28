import 'package:bloc_test/commons/valueobjects/vo.dart';

class User {

  final Name name;
  final String email;
  final String phone;
  final String gender;
  final Location location;
  final Picture picture;

  User({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.location,
    this.picture
  });

  User.fromJson(Map<String, dynamic> json) :
    name = Name.fromJson(json["name"]),
    email = json["email"],
    phone = json["phone"],
    gender = json["gender"],
    location = Location.fromJson(json["location"]),
    picture = Picture.fromJson(json["picture"]);

  String getFormattedName() {
    return "${name.title}. ${name.first} ${name.last}";
  }

}