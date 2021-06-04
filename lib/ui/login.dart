import 'package:agendamentos/domain/user.dart';
import 'package:agendamentos/helpers/api_response.dart';
import 'package:agendamentos/helpers/user_helper.dart';
import 'package:agendamentos/ui/meusAgendamentos.dart';
import 'package:flutter/material.dart';
import 'package:agendamentos/ui/cadastro.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController loginController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _msg = "";
  UserHelper helper = UserHelper();
  User _user;
  Future<User> _futureUser;

  // Future<User> autenticar() async {
  //   _user.name = loginController.text;
  //   _user.email = senhaController.text;

  //   return await helper.autenticar(_user);
  // }

  autenticar() async {
    final login = loginController.text;
    final senha = senhaController.text;

    print("Login: $login , Senha: $senha ");
    ApiResponse response = await helper.autenticar(login, senha);
    if (response.ok) {
      print("Autenticado!");
      _msg = "Autenticação OK";
      agendamento();
    } else {
      setState(() {
        _msg = "Erro no Login";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset(
                "imagens/logo-jf.png",
                alignment: Alignment.center,
                height: 120,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Agendamentos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.blue[900])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                  controller: loginController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira seu login!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  obscureText: true,
                  // keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.blue[900])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
                  controller: senhaController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira sua senha!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          autenticar();
                        }
                      },
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      color: Colors.blue[900],
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    _msg,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 60.0, bottom: 10.0),
                child: Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      child: Text('CADASTRE-SE',
                          style: TextStyle(color: Colors.blue[700])),
                      onPressed: () async {
                        cadastrar();
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void cadastrar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Cadastro()));
  }

  void agendamento() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MeusAgendamentos()));
  }
}
