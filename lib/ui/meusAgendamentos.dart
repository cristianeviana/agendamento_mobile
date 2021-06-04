import 'package:agendamentos/ui/realizarAgendamento.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeusAgendamentos extends StatefulWidget {
  @override
  _MeusAgendamentosState createState() => _MeusAgendamentosState();
}

class _MeusAgendamentosState extends State<MeusAgendamentos> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  void agendar() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Agendamento()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agendar,
        tooltip: 'Novo Agendamento',
        child: Icon(Icons.add),
      ),
    );
  }
}
