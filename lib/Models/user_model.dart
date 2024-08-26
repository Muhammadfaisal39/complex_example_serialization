import 'package:complex_example_serialization/Models/geo_model.dart';

import 'address_model.dart';
import 'company_model.dart';

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Company? company;
  Address? address;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.website,
      this.company,
      this.address});

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    name = map['name'];
    username = map['username'];
    email = map['email'];
    phone = map['phone'];
    website = map['website'];
    address = Address(
        street: map['address']['street'],
        suite: map['address']['suite'],
        city: map['address']['city'],
        zipcode: map['address']['zipcode'],
        geo: Geo(
            lat: map['address']['geo']['lat'],
            lng: map['address']['geo']['lng']));
    company = Company(
        name: map['company']['name'],
        catchPhrase: map['company']['catchPhase'],
        bs: map['company']['bs']);
  }
}
