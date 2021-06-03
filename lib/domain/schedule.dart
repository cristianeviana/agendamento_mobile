class Schedule {
  int id;
  String forum;
  String services;
  String date;
  int hour;
  //User user;

  Schedule();

  Schedule.fromMap(Map map) {
    id = map[id];
    forum = map[forum];
    services = map[services];
    date = map[date];
    hour = map[hour];
  }

  Map toMap() {
    Map<dynamic, dynamic> map = {
      forum: forum,
      services: services,
      date: date,
      hour: hour,
    };

    //if (id != null) map[id] = id;

    return map;
  }

  @override
  String toString() {
    return "Schedule(forum: ${forum}, services: ${services}, date: ${date}, hour: ${hour})";
  }
}
