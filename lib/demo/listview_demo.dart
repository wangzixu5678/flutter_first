import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {

  Widget _itemViewBulder(BuildContext context, int position) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.network(posts[position].imgUrl),
            SizedBox(
              height: 16,
            ),
            Text(
              posts[position].title,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              posts[position].author,
              style: Theme.of(context).textTheme.subtitle,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _itemViewBulder,
      itemCount: posts.length,
    );
  }
}