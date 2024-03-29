import 'package:agendamentos/domain/user.dart';
import 'package:agendamentos/helpers/api_response.dart';
import 'package:agendamentos/helpers/user_helper.dart';
import 'package:agendamentos/ui/login.dart';
import 'package:agendamentos/ui/meusAgendamentos.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  User user;

  Cadastro({this.user});

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  UserHelper helper = UserHelper();
  User _editedUser;
  Future<User> _futureUser;
  String _msg = "";
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmeSenhaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.user == null)
      _editedUser = User();
    else {
      _editedUser = User.fromMap(widget.user.toMap());
      nomeController.text = _editedUser.name;
      emailController.text = _editedUser.email;
      telefoneController.text = _editedUser.phone;
      cpfController.text = _editedUser.cpf;
      senhaController.text = _editedUser.password;
    }
  }

  void retornar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  salvarUsuario() async {
    _editedUser.name = nomeController.text;
    _editedUser.email = emailController.text;
    _editedUser.phone = telefoneController.text;
    _editedUser.cpf = cpfController.text;
    _editedUser.password = senhaController.text;
    _editedUser.password_confirmation = confirmeSenhaController.text;

    ApiResponse response = await helper.salvar(_editedUser);

    if (response.ok) {
      ApiResponse response =
          await helper.autenticar(_editedUser.email, _editedUser.password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MeusAgendamentos()));
    } else {
      setState(() {
        _msg = "Erro ao cadastrar usuário";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Image.asset(
                        "imagens/logo-jf.png",
                        height: 80,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                        child: Text(
                          "Cadastro",
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Nome",
                            labelStyle: TextStyle(color: Colors.grey[800])),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 16.0),
                        controller: nomeController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "Insira seu nome!";
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "CPF",
                            labelStyle: TextStyle(color: Colors.grey[800])),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 16.0),
                        controller: cpfController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "Insira seu CPF!";
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.grey[800])),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 16.0),
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "Insira seu e-mail!";
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Telefone",
                            labelStyle: TextStyle(color: Colors.grey[800])),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 16.0),
                        controller: telefoneController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "Insira seu telefone!";
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.grey[800])),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 16.0),
                        controller: senhaController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "Insira uma senha!";
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Confirmação de senha",
                            labelStyle: TextStyle(color: Colors.grey[800])),
                        textAlign: TextAlign.start,
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 16.0),
                        controller: confirmeSenhaController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "Confirme sua senha!";
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 50.0, right: 10.0),
                          child: Container(
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                retornar();
                              },
                              child: Text(
                                "CANCELAR",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50.0, right: 10.0),
                          child: Container(
                            height: 40.0,
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    _futureUser = salvarUsuario();
                                  });
                                }
                              },
                              child: Text(
                                "CADASTRAR",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                              color: Colors.blue[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                              child: Text(
                                _msg,
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )),
                        ]),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
