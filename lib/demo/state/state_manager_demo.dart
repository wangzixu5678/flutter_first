import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

/**
 * 状态管理
 */
class StateManagerDemo extends StatefulWidget {
  @override
  _StateManagerDemoState createState() => _StateManagerDemoState();
}

class _StateManagerDemoState extends State<StateManagerDemo> {
  int _currentNumber = 0;

  void increaseCount() {
    setState(() {
      _currentNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      currentNumber: _currentNumber,
      voidCallback: increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text("CardDemo"),
          elevation: 0.0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[CounterWrapper()],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentNumber++;
              });
            },
            child: Icon(Icons.add)),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Counter();
  }
}

class Counter extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: Text(CounterProvider.of(context).currentNumber.toString()), onPressed: CounterProvider.of(context).voidCallback);
  }
}

class CounterProvider extends InheritedWidget {

  final int currentNumber;
  final VoidCallback voidCallback;
  final Widget child;

  CounterProvider({this.currentNumber, this.voidCallback, this.child})
      :super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}


/**
 *  scoped_model
 */
class CounterModel extends Model{
  int _count = 0;
  int get count =>_count;
  void increaseCount(){
    _count += 1;
    notifyListeners();
  }
}
