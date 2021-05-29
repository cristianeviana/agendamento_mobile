import 'package:flutter/material.dart';

class Agendamento extends StatefulWidget {
  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController dataController = TextEditingController();
  TextEditingController horarioController = TextEditingController();
  String dropdownValueForum;
  String dropdownValueServico;

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
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Text (
                  "Fórum",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: DropdownButtonFormField<String> (
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  //value: dropdownValueForum,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 32,
                  elevation: 16,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Selecione o fórum",
                      filled: true,
                      hintStyle: TextStyle(fontSize: 14.0),
                      //labelText: "Fórum",
                      //labelStyle: TextStyle(color: Colors.grey[800])
                      ),
                  style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueForum = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value==null || value.isEmpty) return "Insira o fórum do agendamento!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Text (
                  "Serviço",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: DropdownButtonFormField<String> (
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 32,
                  elevation: 16,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      //labelText: "Serviço",
                      hintText: "Selecione o serviço",
                      filled: true,
                      hintStyle: TextStyle(fontSize: 14.0),
                      //labelStyle: TextStyle(color: Colors.grey[800])
                      ),
                  style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueServico = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value==null || value.isEmpty) return "Insira o serviço do agendamento!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Text (
                  "Data",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "dd/mm/aaaa",
                      //labelText: "Data",
                      filled: true,
                      hintStyle: TextStyle(fontSize: 14.0),
                      //labelStyle: TextStyle(color: Colors.grey[800])
                      ),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
                  controller: dataController,
                  validator: (value) {
                    if (value.isEmpty) return "Insira a data do agendamento!";
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Text (
                  "Horário",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                  ),
                ),
              ),              
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "HH:MM",
                      //labelText: "Data",
                      filled: true,
                      hintStyle: TextStyle(fontSize: 14.0),
                      //labelStyle: TextStyle(color: Colors.grey[800])
                      ),
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
                  controller: horarioController,
                  validator: (value) {
                    if (value.isEmpty)
                      return "Insira o horário do agendamento!";
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
                          _formKey.currentState.reset();
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
