import 'package:flutter/material.dart';

class BottomModal extends StatelessWidget {
  BottomModal({this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: this.body,
      ),
    );
  }
}
