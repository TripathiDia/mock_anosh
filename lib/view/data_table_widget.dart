import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mock/model/data_model.dart';

class DataTableWidget extends StatefulWidget {
  List<TableDatum> ? list;

  DataTableWidget({super.key,this.list});

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
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
      
      ], 
      rows:
      widget.list?.map<DataRow>((TableDatum datum) {
      return DataRow(cells: [
        dataCell(datum.lotDescription.toString()),
        dataCell(datum.group.toString()),
        dataCell(datum.units.toString()),
        dataCell(datum.pcs.toString()),
        dataCell(datum.weight.toString()),
        dataCell(datum.rate.toString()),
        dataCell(datum.value.toString()),
        dataCell(datum.sRate.toString()),
        dataCell(datum.sValue.toString()),
      ]);
    }).toList() ?? [],
      ),
    );
  
  }

  DataColumn dataColumn(title) {
    return DataColumn(     
        label: Center(child: Text(title, style: const TextStyle(fontSize: 12),)),
        );
  }

  DataCell dataCell(text) {
    return DataCell(Align(
      alignment: Alignment.centerLeft,
      child:
          Text(text??""),
    ));
  }
}