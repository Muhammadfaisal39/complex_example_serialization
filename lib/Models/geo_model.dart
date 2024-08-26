class Geo{
  String? lat;
  String? lng;

  Geo({this.lat, this.lng});

  Geo.fromMap(Map<String, dynamic> map){
    lat = map['lat'];
    lng = map['lng'];
  }
}
