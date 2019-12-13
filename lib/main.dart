import 'package:flutter/material.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/listview_demo.dart';
void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hellow"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () => debugPrint("Search is Pressed"),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.black,
            indicatorWeight: 1.0,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            Icon(Icons.change_history, size: 128.0, color: Colors.black12),
            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12)
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("王子旭"),
                accountEmail: Text("445826958@qq.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://xinliutong.oss-cn-beijing.aliyuncs.com/lisanbu/816eb4ce3b21421db1cce318f0f400f3.jpg"),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://xinliutong.oss-cn-beijing.aliyuncs.com/lisanbu/c00c0d023e5047b59a900d9a2c72be03.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.yellow[400].withOpacity(0.6),
                          BlendMode.hardLight)),
                ),
              ),
              ListTile(
                  title: Text("Message", textAlign: TextAlign.right),
                  trailing: Icon(Icons.message),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: Text("Favorite", textAlign: TextAlign.right),
                  trailing: Icon(Icons.favorite),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: Text("Setting", textAlign: TextAlign.right),
                  trailing: Icon(Icons.settings),
                  onTap: () => Navigator.pop(context))
            ],
          ),
        ),
        bottomNavigationBar:BottomNavigationBarDemo() ,
      ),
    );
  }
}
