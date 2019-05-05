import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertodoapp/components/task_tile.dart';
import 'package:fluttertodoapp/models/app_state.dart';
import 'package:fluttertodoapp/models/task.dart';
import 'package:fluttertodoapp/pages/add_todo.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StoreConnector<AppState, List<Task>>(
            converter: (store) => store.state.tasks,
            builder: (context, tasks) {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(4),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskTile(tasks[index]);
                  },
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTodoPage(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
