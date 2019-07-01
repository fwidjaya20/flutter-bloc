class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipCode
  });

  Address.fromJson(Map<String, dynamic> json) : 
    street = json["street"],
    suite = json["suite"],
    city = json["city"],
    zipCode = json["zipcode"];

  @override
  String toString() {
    return "$suite $city $street, $zipCode";
  }
}