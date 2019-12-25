import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentActive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StepperDemo"),
        elevation: 0.0,
      ),
      body: Stepper(
        steps: [
          Step(
              title: Text("标题1"),
              subtitle: Text("副标题1"),
              content: Text("内容1内容1内容1内容1内容1内容1内容1内容1内容1内容1"),
              isActive: _currentActive == 0),
          Step(
              title: Text("标题2"),
              subtitle: Text("副标题2"),
              content: Text("内容2内容2内容2内容2内容2内容2内容2内容2内容2内容2"),
              isActive: _currentActive == 1),
          Step(
              title: Text("标题3"),
              subtitle: Text("副标题3"),
              content: Text("内容3内容3内容3内容3内容3内容3内容3内容3内容3内容3"),
              isActive: _currentActive == 2)
        ],
        onStepTapped: (int value) {
          setState(() {
            _currentActive = value;
          });
        },
        currentStep: _currentActive,
        onStepContinue: (){
          setState(() {
            _currentActive = _currentActive < 2 ? _currentActive+1:0;
          });

        },
        onStepCancel: (){
          setState(() {
            _currentActive = _currentActive > 0 ? _currentActive-1:0;
          });
        },
      ),
    );
  }
}
