import 'package:agendamentos/domain/user.dart';
import 'package:agendamentos/helpers/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

const register = "https://justask-api.herokuapp.com/register";
const login = "https://justask-api.herokuapp.com/login";

class UserHelper {
  Future<ApiResponse<User>> salvar(User user) async {
    http.Response response = await http.post(
      Uri.parse(register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'cpf': user.cpf,
        'password': user.password,
        'password_confirmation': user.password_confirmation
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      final usuario = User.fromMap(jsonDecode(response.body));
      return ApiResponse.ok(usuario);
    } else {
      return ApiResponse.error('Falha ao criar usuário.');
    }
    //return json.decode(response.body);
  }

  Future<ApiResponse<User>> autenticar(String email, String senha) async {
    http.Response response = await http.post(
      Uri.parse(login),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': senha}),
    );

    var prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      final usuario = User.fromMap(jsonDecode(response.body));

      Map mapResponse = json.decode(response.body);
      prefs.setString("token", mapResponse["token"]);

      return ApiResponse.ok(usuario);
      //return User.fromMap(jsonDecode(response.body));
    } else {
      return ApiResponse.error("Erro ao fazer o login");
    }
  }
}
