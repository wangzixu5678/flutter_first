import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    this.headerText,
    this.body,
    this.isExpanded,
  });
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> expandedItems = [
    ExpansionPanelItem(
        headerText: "AAA",
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Text("AAAAAAA"),
        ),
        isExpanded: false),
    ExpansionPanelItem(
        headerText: "BBB",
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Text("BBB"),
        ),
        isExpanded: false),
    ExpansionPanelItem(
        headerText: "CCC",
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Text("CCC"),
        ),
        isExpanded: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanelDemo"),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
                children: expandedItems.map((ExpansionPanelItem item) {
                  return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(item.headerText,style: Theme.of(context).textTheme.title),
                        );
                      },
                      body: item.body,
                      isExpanded: item.isExpanded);
                }).toList(),
                expansionCallback: (int panelIndex, bool isExpanded) {
                  setState(() {
                    expandedItems[panelIndex].isExpanded = !isExpanded;
                  });
                })
          ],
        ),
      ),
    );
  }
}
