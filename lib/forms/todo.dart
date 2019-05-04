import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() {
    return _TodoFormState();
  }
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("hi"),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor, digite sua atividade';
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
