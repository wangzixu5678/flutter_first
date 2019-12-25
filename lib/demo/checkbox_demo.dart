import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool checkBoxStatus = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context)
            .copyWith(primaryColor: Colors.green, highlightColor: Colors.green),
        child: Scaffold(
          appBar: AppBar(
            title: Text("CheckBoxDemo"),
            elevation: 0.0,
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CheckboxListTile(
                  value: checkBoxStatus,
                  onChanged: (value) {
                    setState(() {
                      checkBoxStatus = value;
                    });
                  },
                  title: Text("主标题"),
                  subtitle: Text("副标题"),
                  selected: checkBoxStatus,
                  secondary: Icon(Icons.book),
                  checkColor: Colors.yellow,
                  activeColor: Colors.green,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
//                Checkbox(
//                    activeColor: Colors.black,
//                    value: checkBoxStatus,
//                    onChanged: (value) {
//                      setState(() {
//                        checkBoxStatus = value;
//                      });
//                    })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
