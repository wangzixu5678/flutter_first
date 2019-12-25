import 'package:flutter/material.dart';
import 'package:flutter_first/model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        child: Image.network(post.imgUrl, fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0)),
                      )),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imgUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      post.describe,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonTheme.bar(child: ButtonBar(
                    children: <Widget>[
                      FlatButton(onPressed: (){}, child: Text("Like".toLowerCase()))
                    ],
                  ),)
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
