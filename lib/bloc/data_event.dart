// abstract class DataEvent {}

// class LoadData extends DataEvent {}

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
