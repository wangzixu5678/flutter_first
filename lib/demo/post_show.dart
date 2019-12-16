import 'package:flutter/material.dart';
import 'package:flutter_first/model/post.dart';
class PostShow extends StatelessWidget {

  final Post post;

  PostShow({
   @required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(post.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(post.imgUrl),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(post.title,style: Theme.of(context).textTheme.title),
                Text(post.author,style: Theme.of(context).textTheme.subhead),
                Text(post.describe,style: Theme.of(context).textTheme.body1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
