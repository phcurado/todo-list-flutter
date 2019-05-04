import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  TodoForm(this.getVariable);

  final Function getVariable;

  @override
  _TodoFormState createState() {
    return _TodoFormState();
  }
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            onChanged: (value) => widget.getVariable(value),
          ),
          TextFormField(
            controller: titleController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite sua atividade';
              }
            },
            decoration: InputDecoration(labelText: 'asd'),
          ),
          TextFormField(
            controller: descriptionController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite sua atividade';
              }
            },
          )
        ],
      ),
    );
  }
}
