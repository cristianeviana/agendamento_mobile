import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String email, String password) async {
    var url = Uri.parse('https://justask-api.herokuapp.com/login');

    Map params = {"email": email, "password": password};

    var _body = json.encode(params);
    var header = {"Content-Type": "application/json"};
    print("json enviado: $_body");

    var response = await http.post(url, headers: header, body: _body);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map mapResponse = json.decode(response.body);
      String token = mapResponse["token"];
      print("token: $token");
      return true;
    }
    return false;
  }
}
