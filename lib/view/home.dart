import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock/bloc/data_bloc.dart';
import 'package:mock/bloc/data_event.dart';
import 'package:mock/bloc/data_state.dart';
import 'package:mock/model/data_model.dart';
import 'package:mock/view/data_table_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedData = "";
  bool isVisible = false;
  Item ?data;


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final hasPadding = screenWidth > 600;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/BG.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {}),
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70.0, bottom: 6.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Details",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Divider(
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            Padding(
              padding: hasPadding
                  ? const EdgeInsets.only(left: 200.0, right: 200.0)
                  : const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 12, bottom: 12),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(134, 71, 68, 68),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      // width: double.infinity,
                      height: 40,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          onChanged: (c) {
                            context.read<DataBloc>().add(SearchData(c));
                            setState(() {
                              isVisible = true;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            label: Text(selectedData),
                            alignLabelWithHint: true,
                            hintStyle: const TextStyle(color: Colors.black),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        context.read<DataBloc>().add(ClearSearch());
                        setState(() {
                          isVisible = false;
                        });
                      },
                      child: const Text("Clear"))
                ],
              ),
            ),
            Visibility(
                  visible: isVisible,
                  child: Positioned(
                    // left: 20.0,
                    // right: 0.8,
                    child: Card(
                      child: Container(
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: BlocBuilder<DataBloc, DataState>(
                          builder: (context, state) {
                            if (state is DataInitial) {
                              return const SizedBox.shrink();
                            } else if (state is DataLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is DataLoaded) {
                              return ListView.builder(
                                itemCount: state.data.items.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      setState(() {
                                        data = state.data.items[index];
                                      });
                                    },
                                    title: Text(
                                      state.data.items[index].barcode,
                                      style: const TextStyle(
                                          color: Colors.white),
                                    ),
                                  );
                                },
                              );
                            } else if (state is DataError) {
                              return Center(child: Text(state.message));
                            } else {
                              return const Center(
                                  child: Text('Unknown state'));
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              textData(
                                  Text(data?.barcode ?? "Barcode Number"),
                                  1),
                              textData(Text(data?.location ?? "Location"), 1),
                              textData(Text(data?.branch ?? "Branch"), 1),
                              textData(
                                  Text(data?.status?? "Status"), 1),
                              textData(
                                  Text(data?.counter.toString()??"Counter"), 1),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              textData(
                                  Text(data?.source ?? "Source"), 1),
                              textData(
                                  Text(data?.category?? "Category"),
                                  1),
                              textData(Text(data?.collection??"Collection"), 1),
                              textData(Text(data?.description??"Description"), 2)
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              textData(Text(data?.metalGrp??"Metal Grp"), 1),
                              textData(Text(data?.stkSection??"STK Section"), 1),
                              textData(Text(data?.mfgdBy??"Mfgd By"), 1),
                              textData(Text(data?.notes??"Notes"), 2),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              textData(Text(data?.inStkSince.toString()??"In STK since"), 1),
                              textData(Text(data?.certNo??"Cert No."), 1),
                              textData(Text(data?.huidNo??"HUID No."), 1),
                              textData(Text(data?.orderNo.toString()??"Order No."), 1),
                              textData(Text(data?.cusName??"Cus Name"), 1),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: data?.imageLink == null ? const Center(child: Text("Your Image Here"),):  Image.network(data?.imageLink??"",
                           // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHlZZ1Pv-Qv4XKzCS-yAERGk9ebq7wXa-LtLlWfW5egA&s",
                            fit: BoxFit.fitWidth,
                          )),
                    )
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                textData(Text(data?.size??"Size"), 1),
                textData(Text(data?.quality??"Quality"), 1),
                textData(Text(data?.kt.toString()??"KT"), 1),
                textData(Text(data?.pcs.toString()??"Pcs"), 1),
                textData(Text(data?.grossWt.toString()??"Gross Wt"), 1),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      margin: const EdgeInsets.only(left: 08, right: 40),
                      padding: const EdgeInsets.all(08),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      child: Text(data?.netWt.toString()??"Net Wt"),
                    ))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                textData(Text(data?.netWt.toString()??"Dia Pcs"), 1),
                textData(Text(data?.diaWt.toString()??"Dia Wt"), 1),
                textData(Text(data?.clsPcs.toString()??"Cls Pcs"), 1),
                textData(Text(data?.clsWt.toString()??"Cls Wt"), 1),
                textData(Text(data?.chainWt.toString()??"Chain Wt"), 1),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      margin: const EdgeInsets.only(left: 08, right: 40),
                      padding: const EdgeInsets.all(08),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      child: Text(data?.mRate.toString()??"M Rate"),
                    ))
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                textData(const Text("M Value"), 1),
                textData(const Text("L Rate"), 1),
                textData(const Text("L Charges"), 1),
                textData(const Text("R Charges"), 1),
                textData(const Text("O Charges"), 1),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      margin: const EdgeInsets.only(left: 08, right: 40),
                      padding: const EdgeInsets.all(08),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                      child: const Text("MRP"),
                    ))
              ],
            ),
            //const DataTableWidget(),
            const Padding(
              padding: EdgeInsets.only(left:20.0, right:20, top:20, bottom: 0.0),
              child: DataTableWidget(),
            )
          ],
        ),
      ),
    );
  }

  Widget textData(Widget widget, flex) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.only(left: 08),
        padding: const EdgeInsets.all(08),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
          ),
        ),
        child: widget,
      ),
    );
  }
}
