import 'package:flutter/foundation.dart';

class Task {
  final String title;
  final String description;
  bool check = false;

  Task({@required this.title, @required this.description});
}
