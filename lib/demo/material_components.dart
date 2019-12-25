import 'package:flutter/material.dart';

import 'popup_meau_button_demo.dart';
import 'form_demo.dart';
import 'checkbox_demo.dart';
import 'datetime_demo.dart';
import 'simple_dialog_demo.dart';
import 'alert_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'snack_bar_demo.dart';
import 'expansion_panel_demo.dart';
import 'chip_demo.dart';
import 'data_table_demo.dart';
import 'paginated_data_table_demo.dart';
import 'card_demo.dart';
import 'stepper_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MaterialComponents")),
      body: ListView(
        children: <Widget>[
          ListItem(
            title: "StepperDemo",
            page: StepperDemo(),
          ),
          ListItem(
            title: "CardDemo",
            page: CardDemo(),
          ),
          ListItem(
            title: "PaginatedDataTableDemo",
            page: PaginatedDataTableDemo(),
          ),
          ListItem(
            title: "DataTableDemo",
            page: DataTableDemo(),
          ),
          ListItem(
            title: "ChipDemo",
            page: ChipDemo(),
          ),
          ListItem(
            title: "ExpansionPanelDemo",
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: "SnackBarDemo",
            page: SnackBarDemo(),
          ),
          ListItem(
            title: "BottomSheetDemo",
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: "AlertDialogDemo",
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: "SimpleDialogDemo",
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: "DateTimeDemo",
            page: DateTimeDemo(),
          ),
          ListItem(
            title: "CheckBoxDemo",
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: "FormDemo",
            page: FormDemo(),
          ),
          ListItem(
            title: "PopupMenuButton",
            page: PopupMenuBottonDemo(),
          ),
          ListItem(
            title: "ButtonDemo",
            page: ButtonDemo(),
          ),
          ListItem(
            title: "FloatActionButton",
            page: FloatActionButtonDemo(),
          ),
        ],
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * RaisedButton 	：凸起的按钮，其实就是Android中的Material Design风格的Button ，继承自MaterialButton
     * FlatButton  	：扁平化的按钮，继承自MaterialButton
     * OutlineButton		：带边框的按钮，继承自MaterialButton
     * IconButton	：图标按钮,继承自StatelessWidget
     * 固定长度Button 用Container
     * 占满类型的Button类似于权重用Expanded
     * BottonBar 帮你加好间距 并排Button
     */
    Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("Button"),
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          onPressed: () {},
          splashColor: Colors.grey,
          icon: Icon(Icons.add),
          label: Text("Button"),
          textColor: Theme.of(context).accentColor,
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("ButtonDemo")),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[flatButtonDemo],
        ),
      ),
    );
  }
}

class FloatActionButtonDemo extends StatelessWidget {
  Widget _floatingActionButton = FloatingActionButton(
    onPressed: null,
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black54,
  );
  Widget __floatingActionButtonExtend = FloatingActionButton.extended(
      onPressed: null, label: Text("Add"), icon: Icon(Icons.add));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatActionButtonDemo"),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 80),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        });
  }
}
