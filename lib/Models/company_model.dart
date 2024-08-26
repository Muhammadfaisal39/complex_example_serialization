class Company{
  String? name;
  String? catchPhrase;
  String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromMap(Map<String, dynamic> map){
    name = map['name'];
    catchPhrase = map['catchPhrase'];
    bs = map['bs'];
  }

}

