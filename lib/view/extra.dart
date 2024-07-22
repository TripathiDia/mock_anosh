import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock/bloc/data_bloc.dart';
import 'package:mock/bloc/data_event.dart';
import 'package:mock/bloc/data_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DataBloc()..add(LoadData()),
        child: SearchScreen(),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Example with BLoC'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 12),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(134, 71, 68, 68),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 40,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        onChanged: (value) {
                          context.read<DataBloc>().add(LoadData(value));
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          alignLabelWithHint: true,
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<DataBloc>().add(LoadData(''));
                  },
                  child: const Text("Clear"),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<DataBloc, DataState>(
              builder: (context, state) {
                if (state is DataInitial) {
                  return Center(child: Text('Start searching'));
                } else if (state is DataLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DataLoaded) {
                  return ListView.builder(
                    itemCount: state.data.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.data.items[index].barcode),
                      );
                    },
                  );
                } else if (state is DataError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('Unknown state'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
