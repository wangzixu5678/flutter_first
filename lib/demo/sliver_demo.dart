import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title: Text("你好"),
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "wangzixu",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
              background: Image.network(posts[0].imgUrl, fit: BoxFit.cover),
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverSafeArea(
              sliver: SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGridDemo(),
          )),
          SliverListDemo()
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            child: Image.network(posts[index].imgUrl, fit: BoxFit.cover),
          );
        }, childCount: posts.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ));
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Container(
        padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12),
        child: Material(
          elevation: 3.0,
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            children: <Widget>[
              Image.network(posts[index].imgUrl),
              Positioned(
                  bottom: 12.0,
                  right: 12.0,
                  child: Column(
                    children: <Widget>[
                      Text(posts[index].title,
                          style: TextStyle(color: Colors.white)),
                      Text(posts[index].author,
                          style: TextStyle(color: Colors.white))
                    ],
                  ))
            ],
          ),
        ),
      );
    }, childCount: posts.length));
  }
}
