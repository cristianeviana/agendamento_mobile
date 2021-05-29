import 'package:agendamentos/ui/login.dart';
import 'package:agendamentos/ui/realizarAgendamento.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmeSenhaController = TextEditingController();

  void _resetCampos() {
    _formKey.currentState.reset();
    nomeController.clear();
    cpfController.clear();
    emailController.clear();
    telefoneController.clear();
    senhaController.clear();
    confirmeSenhaController.clear();
  }

  void retornar() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void agendar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Agendamento()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[900]),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
        child: Form(
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
                padding: EdgeInsets.only(top: 5.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: nomeController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira seu nome!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "CPF",
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: cpfController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira seu CPF!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: emailController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira seu e-mail!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Telefone",
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: telefoneController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira seu telefone!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: senhaController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira uma senha!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Confirmação de senha",
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: confirmeSenhaController,
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
                          _resetCampos();
                          //retornar();
                          agendar();
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
                    padding: EdgeInsets.only(top: 50.0),
                    child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // metodo
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
            ],
          ),
        ),
      ),
    );
  }
}
