import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertodoapp/forms/todo.dart';
import 'package:fluttertodoapp/models/app_state.dart';
import 'package:fluttertodoapp/models/task.dart';
import 'package:fluttertodoapp/store/actions/task_actions.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String _title;
  String _description;

  _setValues({String title, String description}) {
    setState(() {
      _title = title;
      _description = description;
    });
  }

  _addToDo() {
    return new Task(title: _title, description: _description);
  }

  _goBack(Function callback) {
    callback();
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
              child: TodoForm(_setValues),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: StoreConnector<AppState, VoidCallback>(
                      converter: (store) {
                        return () => store.dispatch(includeTask(_addToDo()));
                      },
                      builder: (context, callback) {
                        return MaterialButton(
                          child: new Text('Adicionar'),
                          onPressed: () => _goBack(callback),
                        );
                      },
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
