import 'package:agendamentos/domain/schedule.dart';
import 'package:agendamentos/helpers/schedule_helper.dart';
import 'package:agendamentos/ui/realizarAgendamento.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeusAgendamentos extends StatefulWidget {
  @override
  _MeusAgendamentosState createState() => _MeusAgendamentosState();
}

class _MeusAgendamentosState extends State<MeusAgendamentos> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  ScheduleHelper helper = ScheduleHelper();
  Future<List<Schedule>> agendamentos;
  List<Schedule> list = new List();
  @override
  void initState() {
    super.initState();

    //agendamentos = getAgendamentos();
    getAgendamentos().then((data) {
      for (Schedule item in data) {
        list.add(item);
      }
    });
  }

  Future<List<Schedule>> getAgendamentos() async {
    return await helper.listaAgendamentos();
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
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: _getCalendarDataSource(list),
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

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

DataSource _getCalendarDataSource(List<Schedule> eventos) {
  List<Appointment> appointments = <Appointment>[];

  for (Schedule item in eventos) {
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      isAllDay: true,
      subject: item.services,
      color: Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
    ));
  }

  return DataSource(appointments);
}
