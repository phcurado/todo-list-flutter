import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  Function _setValues;
  TodoForm(this._setValues);

  @override
  _TodoFormState createState() {
    return _TodoFormState(_setValues);
  }
}

class _TodoFormState extends State<TodoForm> {
  Function _setValues;
  _TodoFormState(this._setValues);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        _setValues(title: _titleController.text, description: _descriptionController.text);
      },
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Título'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite o título';
              }
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Descrição'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor, digite sua descrição';
              }
            },
          )
        ],
      ),
    );
  }
}
