import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String lable;
  Function onClick;
  int index;

  BoardButton(
      {super.key,
      required this.lable,
      required this.onClick,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onClick(index);
            },
            child: Text(
              "$lable",
              style: TextStyle(fontSize: 50, color: Colors.white),
            )));
  }
}
