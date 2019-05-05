import 'package:flutter/material.dart';
import 'package:fluttertodoapp/forms/todo.dart';
import 'package:fluttertodoapp/models/task.dart';
import 'package:fluttertodoapp/store/actions/task_actions.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  _setTask() {
    includeTask(new Task(title: 'Hi', description: 'DESC'));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicione a fazer'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          children: <Widget>[
            Center(
              child: TodoForm(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      child: new Text('Adicionar'),
                      onPressed: _setTask,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
