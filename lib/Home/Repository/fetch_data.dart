import 'dart:convert';

import '../../Models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepo{
  static Future<List<User>> fetchUsers() async{
    try{
      var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
      var response = await http.get(url);
      List data = jsonDecode(response.body);

      List<User> userData = data.map((e) => User.fromMap(e)).toList();
      return userData;
    }catch(e){
      print(e.toString());
      return [];
    }
  }
}