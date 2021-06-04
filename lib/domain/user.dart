class User {
  int id;
  String name;
  String email;
  String phone;
  String cpf;
  String password;
  String password_confirmation;
  String token;

  User();

  User.fromMap(Map map) {
    id = map[id];
    name = map[name];
    email = map[email];
    phone = map[phone];
    cpf = map[cpf];
    password = map[password];
    password_confirmation = map[password_confirmation];
    token = map[token];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      name: name,
      email: email,
      phone: phone,
      cpf: cpf,
      password: password,
      password_confirmation: password_confirmation,
      token: token
    };

    //if (id != null) map[idColumn] = id;

    return map;
  }

  @override
  String toString() {
    return "User(name: ${name}, email: ${email}, phone: ${phone}, cpf: ${cpf})";
  }
}
