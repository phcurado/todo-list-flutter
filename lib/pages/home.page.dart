import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertodoapp/models/app_state.dart';
import 'package:fluttertodoapp/models/task.dart';
import 'package:fluttertodoapp/pages/add_todo.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

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
                    return Center(
                      key:
                          Key(DateTime.now().millisecondsSinceEpoch.toString()),
                      child: CheckboxListTile(
                        title: Text(tasks[index].title),
                        subtitle: Text(tasks[index].description),
                        value: tasks[index].check,
                        secondary: CircleAvatar(
                            child: Icon(tasks[index].check
                                ? Icons.check
                                : Icons.error)),
                        onChanged: (value) {
                          setState(() {
                            tasks[index].check = value;
                          });
                        },
                      ),
                    );
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
