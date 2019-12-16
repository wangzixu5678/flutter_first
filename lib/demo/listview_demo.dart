import 'package:flutter/material.dart';
import '../model/post.dart';
import 'post_show.dart';

class ListViewDemo extends StatelessWidget {
  Widget _itemViewBulder(BuildContext context, int position) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[position].imgUrl,
                      fit: BoxFit.cover,
                    )),
                SizedBox(height: 16.0),
                Text(
                  posts[position].title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  posts[position].author,
                  style: Theme.of(context).textTheme.subtitle,
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    highlightColor: Colors.white.withOpacity(0.1),
                    splashColor: Colors.white.withOpacity(0.3),
                    onTap: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostShow(post: posts[position])));
                    },
                  )),
            )
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
