import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whatsapp/models/user_model.dart';

UserModel? userModel;

Future<UserModel?> getUserData() async {
  final http.Response result =
      await http.get(Uri.parse('https://dummyjson.com/users'));
  if (result.statusCode == 200) {
    return userModelFromJson(result.body);
  } else {
    print('Something is wrong');
  }
  return userModel;
}
