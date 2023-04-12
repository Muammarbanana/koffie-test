import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koffie/core/constants/endpoints.dart';

import '../models/login_model.dart';

class LoginService {
  Future<LoginModel> loginUser({
    required String email,
    required String password,
  }) async {
    String url = baseUrl + loginUrl;
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    var body = jsonEncode({
      'username': email,
      'password': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    debugPrint('test login ${response.body} ${response.statusCode} $body');

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return LoginModel.fromJson(data);
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      throw Exception('${data["status"]!["keterangan"]}');
    } else {
      throw Exception('Error Login: ${data["detail"][0]["msg"]}');
    }
  }
}
