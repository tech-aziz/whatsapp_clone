import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whatsapp/models/user_model.dart';

UserModel? userModel;

Future<UserModel?> getUserData() async {
  return Future.delayed(const Duration(seconds: 0), () async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));
    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    } else {
      print('Something is wrong');
    }
    return userModel;
  });
}
