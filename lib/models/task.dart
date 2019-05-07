import 'package:flutter/foundation.dart';

final String contactTable = "taskTable";
final String idColumn = "idColumn";
final String titleColumn = "titleColumn";
final String descriptionColumn = "descriptionColumn";
final String checkColumn = "checkColumn";

class Task {
  int id;
  String title;
  String description;
  bool check = false;

  Task({@required this.title, @required this.description});

    Task.fromMap(Map map) {
    id = map[idColumn];
    title = map[titleColumn];
    description = map[descriptionColumn];
    check = map[checkColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      titleColumn: title,
      descriptionColumn: description, 
      checkColumn:check,
    };
    if(id != null) {
      map[idColumn] = id;
    }
    return map;
  }

}
