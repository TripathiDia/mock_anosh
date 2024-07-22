// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:mock/model/data_model.dart';

// Future<String> _loadJsonAsset(String path) async {
//   return await rootBundle.loadString(path);
// }

// Future<DataModel> _parseJsonFromAssets() async {
//   final jsonString = await _loadJsonAsset('assets/data.json');
//   final Map<String, dynamic> jsonMap = json.decode(jsonString);
//   return DataModel.fromJson(jsonMap);
// }
// // 