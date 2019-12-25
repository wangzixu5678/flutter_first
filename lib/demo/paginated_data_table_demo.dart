import 'package:flutter/material.dart';
import 'package:flutter_first/model/post.dart';

class PostDataSource extends DataTableSource {
  int _selectCount = 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(posts[index].title)),
      DataCell(Text(posts[index].author)),
      DataCell(Image.network(posts[index].imgUrl)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => posts.length;

  @override
  int get selectedRowCount => _selectCount;
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaginatedDataTableDemo"),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
//                onSelectAll: ,
                header: Text("Posts"),
                source: PostDataSource(),
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
                )
          ],
        ),
      ),
    );
  }
}
