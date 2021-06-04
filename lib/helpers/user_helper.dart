import 'package:agendamentos/domain/user.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const register = "https://justask-api.herokuapp.com/register";

class UserHelper {
  Future<User> salvar(User user) async {
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
        'password_confirmation': user.password
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      return User.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao criar usuário.');
    }
    //return json.decode(response.body);
  }
}
