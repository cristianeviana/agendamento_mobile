import 'package:flutter/material.dart';

class Agendamento extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController forumController = TextEditingController();
  TextEditingController servicoController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController horarioController = TextEditingController();

  void _resetCampos() {
    _formKey.currentState.reset();
    forumController.clear();
    servicoController.clear();
    dataController.clear();
    horarioController.clear();
  }

  Agendamento();

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
                  padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                  child: Text(
                    "Realizar Agendamento",
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Fórum",
                      filled: true,
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: forumController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira o fórum do agendamento!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Serviço",
                      filled: true,
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: servicoController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira o serviço do agendamento!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      labelText: "Data",
                      filled: true,
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: dataController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira a data do agendamento!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      labelText: "Horário",
                      filled: true,
                      labelStyle: TextStyle(color: Colors.grey[800])),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 16.0),
                  controller: horarioController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira o horário do agendamento!";
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
