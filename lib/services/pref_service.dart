import 'dart:convert';

import 'package:homework/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference{
  // static setName(String name) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString("name", name);
  // }
  //
  // static Future<String?> getName() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.getString("name");
  // }
  //
  // static Future<bool> removeName() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.remove("name");
  // }

  static setUser(User user) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    preferences.setString('user', stringUser);
  }

  static Future<User?> getUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userString = preferences.getString("user");
    if(userString!.isEmpty){
      return null;
    }
    Map<String,dynamic> map = jsonDecode(userString);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove("user");
  }
}