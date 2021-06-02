class User {
  // static final String userTable = "userTable";
  // static final String idColumn = "idColumn";
  // static final String nameColumn = "nameColumn";
  // static final String phoneColumn = "phoneColumn";
  // static final String emailColumn = "emailColumn";
  // static final String cpfColumn = "cpfColumn";
  // static final String passwordColumn = "passwordColumn";

  //int id;
  String name;
  String email;
  String phone;
  String cpf;
  String password;

  User();

  User.fromMap(Map map) {
    // id = map[idColumn];
    name = map[name];
    email = map[email];
    phone = map[phone];
    cpf = map[cpf];
    password = map[password];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      name: name,
      email: email,
      phone: phone,
      cpf: cpf,
      password: password,
    };

    //if (id != null) map[idColumn] = id;

    return map;
  }

  @override
  String toString() {
    return "User(name: ${name}, email: ${email}, phone: ${phone}, cpf: ${cpf})";
  }
}
