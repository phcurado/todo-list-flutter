import 'package:flutter/material.dart';
import 'package:fluttertodoapp/forms/todo.dart';

class AddTodoPage extends StatefulWidget {
  AddTodoPage({Key key}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  int _counter = 0;
  String _title;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _getVariable(String title, String description) {
    setState(() {
      _title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicione afazer'),
      ),
      body: Column(
        children: <Widget>[
          Text(this._title),
          Center(
            child: TodoForm(_getVariable),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
