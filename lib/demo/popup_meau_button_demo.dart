import 'package:flutter/material.dart';

class PopupMenuBottonDemo extends StatefulWidget {
  @override
  _PopupMenuBottonDemoState createState() => _PopupMenuBottonDemoState();
}

class _PopupMenuBottonDemoState extends State<PopupMenuBottonDemo> {
  String _currentSelect = '1111';

  

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
              children: <Widget>[
                Text(_currentSelect),
                PopupMenuButton(
                  onSelected: (value) {
                    setState(() {
                      _currentSelect = value;
                    });
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text("1111"),value: "111",),
                    PopupMenuItem(child: Text("2222"),value: "222",),
                    PopupMenuItem(child: Text("3333"),value: "333",),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
