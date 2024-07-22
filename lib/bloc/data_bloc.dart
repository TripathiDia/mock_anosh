import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock/bloc/data_event.dart';
import 'package:mock/bloc/data_state.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mock/model/data_model.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<SearchData>(_onLoadData);
   // on<ClearSearch>(_onClearSearch);
    //on<DataSelected>(_onSelectedItem as EventHandler<DataSelected, DataState>);
  }

  Future<String> _loadJsonAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<DataModel> _parseJsonFromAssets() async {
  final jsonString = await _loadJsonAsset('assets/data.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  return DataModel.fromJson(jsonMap);
}


  Future<void> _onLoadData(SearchData event, Emitter<DataState> emit) async {
    emit(DataLoading());
    try {
      final data = await _parseJsonFromAssets();
      emit(DataLoaded(data));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }


   void _onSearchData(SearchData event, Emitter<DataState> emit) {
    if (state is DataLoaded) {
      final currentState = state as DataLoaded;
      final filteredData = currentState.data.items.where((item) {
        return item.barcode.toLowerCase().contains(event.query.toLowerCase());
      }).toList();
      emit(DataLoaded(DataModel(items: filteredData)));
    }
  }

  
}

