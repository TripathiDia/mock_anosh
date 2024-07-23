import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock/bloc/data_event.dart';
import 'package:mock/bloc/data_state.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mock/model/data_model.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<SearchData>(_onLoadData);
    on<ClearData>(_onClearData);
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

      final filteredData = data.items.where((item) {
        return item.barcode.toLowerCase().contains(event.query.toLowerCase());
      }).toList();
      emit(DataLoaded(DataModel(items: filteredData)));
    } catch (e) {
      emit(DataError(e.toString()));
    }
  }

   void _onClearData(ClearData event, Emitter<DataState> emit) {
  try {
    emit(DataLoaded(DataModel(items: [])));  
    print("Data cleared successfully");
  } catch (e) {
    emit(DataError(e.toString()));
  }
}
  
}

