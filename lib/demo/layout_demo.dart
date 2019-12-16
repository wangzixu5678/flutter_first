import 'package:flutter/material.dart';
class LayoutDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(

      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: IconBadge(Icons.pool),
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: IconBadge(Icons.pool),
              ),
            ),
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: IconBadge(Icons.pool),
              ),
            )
          ],)
        ],
      ) ,
    );

  }

}


class IconBadge extends StatelessWidget{
  final IconData icon;
  final double size;

  IconBadge(this.icon,{
    this.size = 32.0
  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
       child: Icon(icon,size: size,color: Colors.white,),
       width: size + 60,
       height: size + 60,
       color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}