import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamDemoHome();
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamController;
  StreamSink _sinkDemo;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamController.close();
  }
  @override
  void initState() {
    super.initState();

//    _streamController = StreamController<String>();
    //多个订阅
    _streamController = StreamController.broadcast();

    _sinkDemo = _streamController.sink;
//    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    //多个订阅
    _streamController.stream
        .listen(onData, onError: onError, onDone: onDone);

    _streamController.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);
  }



  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
//    throw 'Something happend';
    return "Hellow";
  }

  void onData(String data) {
    print("$data");
  }

  void onDataTwo(String data) {
    print("$data");
  }

  void onError(error) {
    print("$error");
  }

  void onDone() {
    print("Done");
  }

  void addDataToStream() async {
    print("Add");
    String data = await fetchData();
//    _streamController.add(data);
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FormDemo")),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder(
                builder: (context, snapshot) {
                  return Text('${snapshot.data}');
                },
                initialData: "...",
                stream: _streamController.stream,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(onPressed: addDataToStream, child: Text("Add")),
                  FlatButton(
                      onPressed: () {
                        print("Pause");
                        _streamSubscription.pause();
                      },
                      child: Text("Pause")),
                  FlatButton(
                      onPressed: () {
                        print("Resume");
                        _streamSubscription.resume();
                      },
                      child: Text("Resume")),
                  FlatButton(
                      onPressed: () {
                        print("Cancel");
                        _streamSubscription.cancel();
                      },
                      child: Text("Cancel"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
