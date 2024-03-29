import 'package:agendamentos/domain/schedule.dart';
import 'package:agendamentos/helpers/api_response.dart';
import 'package:agendamentos/helpers/schedule_helper.dart';
import 'package:agendamentos/ui/meusAgendamentos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Agendamento extends StatefulWidget {
  Schedule schedule;

  Agendamento({this.schedule});

  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController dataController = TextEditingController();
  String dropdownValueForum;
  String dropdownValueServico;
  int dropdownValueHorario;

  ScheduleHelper helper = ScheduleHelper();
  Schedule _editedSchedule;
  Future<Schedule> _futureSchedule;

  @override
  void initState() {
    super.initState();

    if (widget.schedule == null)
      _editedSchedule = Schedule();
    else {
      _editedSchedule = Schedule.fromMap(widget.schedule.toMap());
      dropdownValueForum = _editedSchedule.forum;
      dropdownValueServico = _editedSchedule.services;
      dataController.text = _editedSchedule.date;
      dropdownValueHorario = _editedSchedule.hour;
    }
  }

  salvarSchedule() async {
    _editedSchedule.forum = dropdownValueForum;
    _editedSchedule.services = dropdownValueServico;
    _editedSchedule.date =
        new DateFormat("dd/MM/yyyy").parse(dataController.text).toString();
    _editedSchedule.hour = dropdownValueHorario;

    ApiResponse response = await helper.salvar(_editedSchedule);

    if (response.ok) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MeusAgendamentos()));
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao cadastrar agendamento!')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[900]),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
        child: (_futureSchedule == null) ? buildColumn() : buildFutureBuilder(),
      ),
    );
  }

  Column buildColumn() {
    return Column(
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
                  child: Text(
                    "Fórum",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButtonFormField<String>(
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
                    items: <String>[
                      'ASSÚ',
                      'CAICÓ',
                      'CEARÁ MIRIM',
                      'MOSSORÓ',
                      'NATAL',
                      'PAU DOS FERROS'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Insira o fórum do agendamento!";
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Serviço",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButtonFormField<String>(
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
                    items: <String>[
                      'Auxílio Emergencial',
                      'Previdenciário',
                      'Ação Indenizatória'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Insira o serviço do agendamento!";
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Data",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  // child: TextFormField(
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   keyboardType: TextInputType.datetime,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: "dd/mm/aaaa",
                  //     //labelText: "Data",
                  //     filled: true,
                  //     hintStyle: TextStyle(fontSize: 14.0),
                  //     //labelStyle: TextStyle(color: Colors.grey[800])
                  //   ),
                  //   textAlign: TextAlign.start,
                  //   style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
                  //   controller: dataController,
                  //   validator: (value) {
                  //     if (value.isEmpty) return "Insira a data do agendamento!";
                  //   },
                  // ),
                  child: DateTimeField(
                    format: DateFormat("dd/MM/yyyy"),
                    controller: dataController,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(2021),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2024));
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                  child: Text(
                    "Horário",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: DropdownButtonFormField<int>(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 32,
                    elevation: 16,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //labelText: "Serviço",
                      hintText: "Selecione o horário",
                      filled: true,
                      hintStyle: TextStyle(fontSize: 14.0),
                      //labelStyle: TextStyle(color: Colors.grey[800])
                    ),
                    style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
                    onChanged: (int newValue) {
                      setState(() {
                        dropdownValueHorario = newValue;
                      });
                    },
                    items: [
                      DropdownMenuItem<int>(
                        child: Text('07:00'),
                        value: 7,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('08:00'),
                        value: 8,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('09:00'),
                        value: 9,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('10:00'),
                        value: 10,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('11:00'),
                        value: 11,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('13:00'),
                        value: 13,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('14:00'),
                        value: 14,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('15:00'),
                        value: 15,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('16:00'),
                        value: 16,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('17:00'),
                        value: 17,
                      ),
                      DropdownMenuItem<int>(
                        child: Text('18:00'),
                        value: 18,
                      ),
                    ],
                    validator: (value) {
                      if (value == null)
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
                              setState(() {
                                _futureSchedule = salvarSchedule();
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
              ],
            ),
          ),
        ]);
  }

  FutureBuilder<Schedule> buildFutureBuilder() {
    return FutureBuilder<Schedule>(
      future: _futureSchedule,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text('Agendamento cadastrado com sucesso!');
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
