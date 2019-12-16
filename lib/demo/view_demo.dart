import 'package:flutter/material.dart';
import 'package:flutter_first/model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridViewBuildDemo();
  }
}

//PageView 死板写法
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
//      pageSnapping: false,
//      reverse: true,
//      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => (debugPrint("$currentPage")),
      controller: PageController(
          initialPage: 1, keepPage: false, viewportFraction: 0.85),
      children: <Widget>[
        Container(
          color: Colors.brown[100],
          alignment: Alignment(0.0, 0.0),
          child: Text("One",
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.black,
          alignment: Alignment(0.0, 0.0),
          child: Text("Two",
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.green[100],
          alignment: Alignment(0.0, 0.0),
          child: Text("Third",
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        )
      ],
    );
  }
}

//PageView 比较活写法
class PageViewBuildDemo extends StatelessWidget {
  Widget _viewBuilder(BuildContext context, int position) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[position].imgUrl, fit: BoxFit.cover),
        ),
        Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(posts[position].title,
                    style: TextStyle(color: Colors.white)),
                Text(posts[position].author,
                    style: TextStyle(color: Colors.white))
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(itemBuilder: _viewBuilder, itemCount: posts.length);
  }
}

//通过实际最大数量 来限制一行 显示个数
class GridViewDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.green,
        alignment: Alignment(0.0, 0.0),
        child: Text("item $index"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
//      scrollDirection: ,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      crossAxisCount: 3,
      children: _buildTitles(100),
    );
  }
}

//通过最大宽度 来限制一行 显示个数
class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTitles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.green,
        alignment: Alignment(0.0, 0.0),
        child: Text("item $index"),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.extent(
      maxCrossAxisExtent: 110,
      children: _buildTitles(100),
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      scrollDirection: Axis.vertical,
    );
  }
}

class GridViewBuildDemo extends StatelessWidget {
  Widget _getItmeBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 8.0, crossAxisSpacing: 8.0),
      itemBuilder: _getItmeBuilder,
      padding: EdgeInsets.all(3.0),
      itemCount: posts.length,
    );
  }
}
