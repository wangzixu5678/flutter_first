import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationBarDemoState();
  }
}

class BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int currentPos = 0;
  void _onBottomNavigationClick(int position) {
    setState(() {
      currentPos = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onBottomNavigationClick,
      currentIndex: currentPos,
      items: [
        BottomNavigationBarItem(title: Text("Explore"), icon: Icon(Icons.explore)),
        BottomNavigationBarItem(title: Text("History"), icon: Icon(Icons.history)),
        BottomNavigationBarItem(title: Text("List"), icon: Icon(Icons.list)),
        BottomNavigationBarItem(title: Text("My"), icon: Icon(Icons.person))
      ],
    );
  }
}
