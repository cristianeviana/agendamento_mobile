class Schedule {
  int id;
  String forum;
  String services;
  String date;
  int hour;
  //User user;

  Schedule({this.id, this.forum, this.services, this.date, this.hour});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
        id: json["id"],
        forum: json["forum"],
        services: json["services"],
        date: json["date"],
        hour: json["hour"]);
  }

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
