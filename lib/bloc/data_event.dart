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


class ClearSearch extends DataEvent {
  

  const ClearSearch();

  @override
  List<Object?> get props => [''];
}

class DataSelected extends DataEvent {
  final String selectedBarcode;
  final String selectedCertNo;
  final String selectedLocation;

  const DataSelected(this.selectedBarcode, this.selectedCertNo, this.selectedLocation);

  @override
  List<Object?> get props => [selectedBarcode, selectedCertNo, selectedLocation];
}

