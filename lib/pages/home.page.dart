import 'package:flutter/material.dart';
import 'package:fluttertodoapp/entities/Task.dart';
import '../pages/add_todo.page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

  void _setVariable(String title, String description) {
    Task task = Task();
    task.title = title;
    task.description = description;
    task.check = false;
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(4),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              print(tasks[index].check);
              return Center(
                  key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
                  child: CheckboxListTile(
                    title: Text(tasks[index].title),
                    subtitle: Text(tasks[index].description),
                    value: tasks[index].check,
                    secondary: CircleAvatar(
                        child: Icon(
                            tasks[index].check ? Icons.check : Icons.error)),
                    onChanged: (value) {
                      setState(() {
                        tasks[index].check = value;
                      });
                    },
                  ));
            },
          ))
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
