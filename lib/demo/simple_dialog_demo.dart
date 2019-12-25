import 'package:flutter/material.dart';
import 'dart:async';


enum Option { A, B, C }
class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String choise = "Noting";

  void _showSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              title: Text("SimpleDialog"),
              children: <Widget>[
                SimpleDialogOption(
                    child: Text("Option A"),
                    onPressed: () {
                      Navigator.pop(context, Option.A);
                    }),
                SimpleDialogOption(
                    child: Text("Option B"),
                    onPressed: () {
                      Navigator.pop(context, Option.B);
                    }),
                SimpleDialogOption(
                    child: Text("Option C"),
                    onPressed: () {
                      Navigator.pop(context, Option.C);
                    }),
              ],
            ));

    switch (option) {
      case Option.A:
        setState(() {
          choise = "this A";
        });

        break;
      case Option.B:
        setState(() {
          choise = "this B";
        });

        break;
      case Option.C:
        setState(() {
          choise = "this C";
        });
        break;
      default:
        setState(() {
          choise = "Noting";
        });
        break;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(choise)],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSimpleDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
