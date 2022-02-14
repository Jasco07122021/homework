import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:homework/models/lesson6_4_model.dart';

class HiveDB {
  static var box = Hive.box("pdp_online");

  static setData(UserLesson6H4 user) {
    Map<String, dynamic> map = user.toJson();
    box.put("user", jsonEncode(map));
  }

  static String getData(){
    String response = box.get("user");
    return response;
  }
}
