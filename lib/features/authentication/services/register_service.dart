import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:koffie/core/constants/endpoints.dart';

import '../models/register_model.dart';

class RegisterService {
  Future<RegisterModel> registerUser({
    required String email,
    required String phone,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    String url = baseUrl + registerUrl;
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'hp': phone,
      'firstname': firstName,
      'lastname': lastName,
      'password': password,
      'grup': 'member',
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RegisterModel.fromJson(data);
    } else if (response.statusCode == 400 || response.statusCode == 404) {
      throw Exception('${data["status"]!["keterangan"]}');
    } else {
      throw Exception('Error Register: ${data["detail"][0]["msg"]}');
    }
  }
}
