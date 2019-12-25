import 'package:flutter/material.dart';
import 'dart:async';

enum Option { OK, CANCEL }

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {

   String _choice = "Noting";

  Future<Option> _openAlertDialog() async {
    final option = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("我是主标题"),
            content: Text("我是AlertDialog内容"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Option.OK);
                  },
                  child: Text("Ok")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Option.CANCEL);
                  },
                  child: Text("Cancel")),
            ],
          );
        });
    if (option == Option.OK) {
      setState(() {
        _choice = "OK";
      });
    } else if (option == Option.CANCEL) {
      setState(() {
        _choice = "CANCEL";
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_choice),
                RaisedButton(
                  onPressed: _openAlertDialog,
                  child: Text("Open AlertDialog"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
