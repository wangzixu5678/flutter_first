import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  final registerGlobalKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: registerGlobalKey,
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
                RaisedButton(
                  onPressed:(){
                    registerGlobalKey.currentState.showSnackBar(SnackBar(content:Text("ok")));
                  },
                  child: Text("Show SnackBar"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//class SnackBarButton extends StatefulWidget {
//  @override
//  _SnackBarButtonState createState() => _SnackBarButtonState();
//}
//
//class _SnackBarButtonState extends State<SnackBarButton> {
//  @override
//  Widget build(BuildContext context) {
//    return  ;
//  }
//}









