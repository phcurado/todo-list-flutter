import 'package:flutter/material.dart';
import 'package:fluttertodoapp/models/task.dart';

class TaskTile extends StatefulWidget {
  TaskTile(this.task);

  final Task task;

  @override
  _TaskTileState createState() => _TaskTileState(task);
}

class _TaskTileState extends State<TaskTile> {
  _TaskTileState(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Center(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      child: CheckboxListTile(
        title: Text(task.title != null ? task.title : ""),
        subtitle: Text(task.description != null ? task.description : ""),
        value: task.check,
        secondary:
            CircleAvatar(child: Icon(task.check ? Icons.check : Icons.error)),
        onChanged: (value) {
          setState(() {
            task.check = value;
          });
        },
      ),
    );
  }
}
