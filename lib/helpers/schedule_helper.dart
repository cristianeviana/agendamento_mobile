import 'package:agendamentos/domain/schedule.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const postSchedule = "https://justask-api.herokuapp.com/schedule";

class ScheduleHelper {
  Future<Schedule> salvar(Schedule schedule) async {
    http.Response response = await http.post(
      Uri.parse(postSchedule),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<dynamic, dynamic>{
        'forum': schedule.forum,
        'services': schedule.services,
        'date': schedule.date,
        'hour': schedule.hour,
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      return Schedule.fromMap(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
    //return json.decode(response.body);
  }
}