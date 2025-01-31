import 'package:flutter/material.dart';

class Custumdatatable extends StatelessWidget {
final List<DataColumn> columns;
final List<DataRow> rows;

  const Custumdatatable({
    super.key,required this.columns,required this.rows});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      border: TableBorder.all(
        color: Colors.grey,
        width: 2,
      ),
      columns: columns, rows: rows);
  }
}