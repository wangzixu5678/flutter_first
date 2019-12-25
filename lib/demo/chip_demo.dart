import 'dart:math';

import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ["Apple", "Banana", "Orange"];
  List<String> _select = [];
  String _actionChois = "Noting";
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tags = ["Apple", "Banana", "Orange"];
            _select = [];
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      appBar: AppBar(
        title: Text("ChipDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(label: Text("Life")),
                Chip(
                  label: Text("Sunset"),
                  backgroundColor: Colors.yellow,
                ),
                Chip(
                    label: Text("Wanghao"),
                    avatar: CircleAvatar(child: Text("旭"))),
                Chip(
                    label: Text("wanghao"),
                    avatar: CircleAvatar(
                        child: Image.network(
                            "http://xinliutong.oss-cn-beijing.aliyuncs.com/lisanbu/d5a168c5a04c4323b198bd04583b1f13.jpg"))),
                Chip(
                  label: Text("City"),
                  deleteIcon: Icon(Icons.delete),
                  deleteButtonTooltipMessage: "Remover this tag",
                  onDeleted: () {},
                ),
                Divider(color: Colors.red, height: 8.0, indent: 8.0),
                Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: _tags.map((String tag) {
                      return Chip(
                          label: Text(tag),
                          onDeleted: () {
                            setState(() {
                              _tags.remove(tag);
                            });
                          });
                    }).toList()),
                Divider(color: Colors.red, height: 8.0, indent: 8.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("ActionClip: $_actionChois"),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: _tags.map((tag) {
                          return ActionChip(
                            label: Text(tag),
                            onPressed: () {
                              setState(() {
                                _actionChois = tag;
                              });
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                Divider(color: Colors.red, height: 8.0, indent: 8.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("FilterChip: ${_select.toString()}"),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: _tags.map((tag) {
                          return FilterChip(
                            label: Text(tag),
                            onSelected: (bool isSelect) {
                              setState(() {
                                if (_select.contains(tag)) {
                                  _select.remove(tag);
                                } else
                                  _select.add(tag);
                              });
                            },
                            selected: _select.contains(tag),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
                Divider(color: Colors.red, height: 8.0, indent: 8.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("ChoiceChip: $_selected"),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: _tags.map((tag) {
                          return ChoiceChip(
                              label: Text(tag),
                              selectedColor: Colors.black,
                              selected: tag == _selected,
                              onSelected: (bool isSelected) {
                                setState(() {
                                  if (tag != _selected) {
                                    _selected = tag;
                                  }
                                });
                              });
                        }).toList(),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
