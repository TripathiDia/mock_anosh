import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color.fromARGB(255, 32, 28, 28),
        child: DataTable(columns: [
          dataColumn("LOT Description"),
          dataColumn("Group"),
          dataColumn("Units"),
          dataColumn("Pcs"),
          dataColumn("Weight"),
          dataColumn("Rate"),
          dataColumn("Value"),
          dataColumn("S Rate"),
          dataColumn("S Value"),
        
        ], rows: [
         DataRow(cells: [
          dataCell(),
          dataCell(),
          dataCell(),
          dataCell(),
          dataCell(),
          dataCell(),
          dataCell(),
          dataCell(),
          dataCell(),
        
         ])
        ]),
      ),
    );
  }

  DataColumn dataColumn(title) {
    return DataColumn(
        label: Center(
          child: Text(title),
        ),);
  }

  DataCell dataCell() {
    return const DataCell(Center(
      child:
          Text(""),
    ));
  }
}