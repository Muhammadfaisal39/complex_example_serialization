import 'geo_model.dart';
class Address{
 String? street;
 String? suite;
 String? city;
 String? zipcode;
 Geo? geo;

 Address({this.street, this.suite, this.city, this.zipcode, this.geo});

 Address.fromMap(Map<String, dynamic> map){
  street = map['street'];
  suite = map['suite'];
  city = map['city'];
  zipcode = map['zipcode'];
  geo = Geo(
   lng: map['address']['lng'],
   lat: map['address']['lat'],
  );
 }
}

