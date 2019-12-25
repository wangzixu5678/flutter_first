import 'package:flutter/material.dart';
import 'package:flutter_first/model/post.dart';



class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PopupMenuButtonDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            DataTable(
//                onSelectAll: ,
                sortAscending: _sortAscending,
                sortColumnIndex: _sortColumnIndex,
                columns: [
                  DataColumn(
                      label: Text("title"),
                      onSort: (int columnIndex, bool ascending) {
                        setState(() {
                          _sortAscending = ascending;
                          _sortColumnIndex = columnIndex;
                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(label: Text("author")),
                  DataColumn(label: Text("img"))
                ],
                rows: posts.map((post) {
                  return DataRow(
                      cells: [
                        DataCell(Text(post.title)),
                        DataCell(Text(post.author)),
                        DataCell(Image.network(post.imgUrl)),
                      ],
                      selected: post.isSelected,
                      onSelectChanged: (bool isSelect) {
                        setState(() {
                          if(post.isSelected!=isSelect){
                            post.isSelected = isSelect;
                          }
                        });
                      });
                }).toList())
          ],
        ),
      ),
    );
  }
}
