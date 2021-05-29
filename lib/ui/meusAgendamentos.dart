import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeusAgendamentos extends StatefulWidget {
  @override
  _MeusAgendamentosState createState() => _MeusAgendamentosState();
}

class _MeusAgendamentosState extends State<MeusAgendamentos> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      monthViewSettings: MonthViewSettings(showAgenda: true),
    ));
  }
}
