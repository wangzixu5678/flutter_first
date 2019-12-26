import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RxDartDemo"),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _publishSubject;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//  Observable<String> observable =Observable(Stream.fromIterable(["hello", "您好"]));
//  Observable<String> observable = Observable.fromIterable(["hello","你好"]);
//  Observable<String> observable2 = Observable.fromFuture(Future.value("你好"));
//  Observable<String> observable3= Observable.just("hello");
//  Observable<String> observable4 = Observable.periodic(Duration(seconds: 3),(x)=>x.toString());
//  observable.listen(print);

//    ReplaySubject replaySubject = ReplaySubject<String>();
//    BehaviorSubject behaviorSubject  = BehaviorSubject<String>();
//    PublishSubject _publishSubject = PublishSubject<String>();
//    _publishSubject.listen((data)=>print("listen 1 $data"));
//    _publishSubject.add("hello");
//    _publishSubject.listen((data)=>print("listen 2 $data"));
//    _publishSubject.close();

    _publishSubject = PublishSubject();
    _publishSubject
//        .map((item) => " : $item")
//        .where((item)=>item.length>9)
//        .debounce(Duration(milliseconds: 500))  0.5秒发射事件源 不然都过滤
        .listen((data) => print("text change $data"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _publishSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        decoration: InputDecoration(labelText: "title", filled: true),
        onChanged: (text) {
          _publishSubject.add(text);
        },
        onSubmitted: (text) {
          _publishSubject.add(text);
        },
      ),
    );
  }
}
