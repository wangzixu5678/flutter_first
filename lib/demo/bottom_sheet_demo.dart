import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16.0),
              Text("01:30 / 3.30"),
              Expanded(
                  child: Text("Fix you -Coldplay", textAlign: TextAlign.right))
            ],
          ),
        ),
      );
    });
  }

  Future _openModalBottomSheet() async {
    final String returnStr = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200.0,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ListTile(
                    title: Text("Option A"),
                    onTap: () {
                      Navigator.pop(context, "A");
                    }),
                ListTile(
                  title: Text("Option B"),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text("Option C"),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                )
              ],
            ),
          );
        });
    debugPrint(returnStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text("BottomSheetDemo"),
        elevation: 0.0,
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    onPressed: _openBottomSheet,
                    child: Text("openBottomSheet")),
                RaisedButton(
                    onPressed: _openModalBottomSheet,
                    child: Text("openModalBottomSheet"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
