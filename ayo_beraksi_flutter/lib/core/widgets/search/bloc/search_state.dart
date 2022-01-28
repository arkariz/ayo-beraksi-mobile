part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  final LaporanList? laporanList;
  const SearchState({this.laporanList});

  @override
  List<Object?> get props => [laporanList];
}

class SearchInit extends SearchState {
  const SearchInit({LaporanList? laporanList}) : super(laporanList: laporanList);
}

class Searching extends SearchState {
  const Searching();
}

class SearchFound extends SearchState {
  const SearchFound(LaporanList? laporanList) : super(laporanList: laporanList);
}

class SearchNotFoundState extends SearchState {
  const SearchNotFoundState();
}
