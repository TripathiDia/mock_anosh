import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class SearchData extends DataEvent {
  final String query;

  const SearchData(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearData extends DataEvent {

  const ClearData();

  @override
  List<Object?> get props => [];
}

