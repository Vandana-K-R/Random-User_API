import 'dart:convert';

import 'package:random_user_api/features/user/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<UserModel>> userFetch() async {
    try {
      final String url = 'https://randomuser.me/api/?results=10';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body)['results'];
        List<UserModel> users = result.map((json) {
          return UserModel.fromMap(json);
        }).toList();

        return users;
      } else {
        throw Exception('failed to fetch users');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
