import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[RegisterFormState()],
          )),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFromDemo extends StatefulWidget {
  @override
  _TextFromDemoState createState() => _TextFromDemoState();
}

class _TextFromDemoState extends State<TextFromDemo> {
  var textEditController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textEditController.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditController.addListener(() {
      debugPrint(textEditController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "请输入内容",
          icon: Icon(Icons.subject),
          labelText: "title",
//          border: InputBorder.none,
          filled: true,
//          border: OutlineInputBorder()
        ),
//        onChanged: (value) {},
//        onSubmitted: (value) {},
        controller: textEditController,
      ),
    );
  }
}

class RegisterFormState extends StatefulWidget {
  @override
  _RegisterFormStateState createState() => _RegisterFormStateState();
}

class _RegisterFormStateState extends State<RegisterFormState> {

  final registerGlobalKey =  GlobalKey<FormState>();

  String userName,passWord;
  bool autovalidate = false;


  void onSubmitSaved(){
    if(registerGlobalKey.currentState.validate()){
      registerGlobalKey.currentState.save();
      debugPrint("$userName");
      debugPrint("$passWord");

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Registering...."),
      ));
    }else{
      setState(() {
        autovalidate = true;
      });
    }

  }

  String validatorUserName(value){
    if(value.isEmpty){
      return "UserName is Required";
    }
    return null;
  }

  String validatorPassword(value){
    if(value.isEmpty){
      return "Password is Required";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Form(
          key: registerGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "UserName",helperText: ""),
                onSaved: (value){
                  userName = value;
                },
                validator: validatorUserName,
                autovalidate: autovalidate,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password",helperText: ""),
                onSaved: (value){
                  passWord = value;
                },
                validator: validatorPassword,
                autovalidate: autovalidate,
              ),
              SizedBox(
                height: 30.0,
              ),
              RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text("Register"),
                  onPressed:onSubmitSaved)
            ],
          )),
    );
  }
}
