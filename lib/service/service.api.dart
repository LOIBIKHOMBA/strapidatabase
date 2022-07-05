import 'dart:convert';
import 'dart:developer';

import 'package:fetchdatafromserver/model/user.model.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<List<UserModel>> getdata() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    final data = jsonDecode(response.body) as List;

    var users = data.map((e) => UserModel.fromJson(e)).toList();
    return users;
  }
}
