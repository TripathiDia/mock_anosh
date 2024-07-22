import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(134, 71, 68, 68),
      child: DataTable(
        showBottomBorder: false,
        headingRowColor: MaterialStateProperty.all<Color>(const Color.fromARGB(136, 112, 103, 103)),
        columns: [
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
      
       ]),
      
      ]),
    );
  }

  DataColumn dataColumn(title) {
    return DataColumn(     
        label: Text(title, style: const TextStyle(fontSize: 12),),
        );
  }

  DataCell dataCell() {
    return const DataCell(Center(
      child:
          Text(""),
    ));
  }
}