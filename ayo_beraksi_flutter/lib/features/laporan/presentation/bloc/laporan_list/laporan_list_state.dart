part of 'laporan_list_bloc.dart';

abstract class LaporanListState extends Equatable {
  final LaporanList? laporanList;
  final DioError? error;

  const LaporanListState({this.laporanList, this.error});

  @override
  List<Object?> get props => [laporanList, error];
}

class LaporanListInitial extends LaporanListState {}

class LaporanListSuccess extends LaporanListState {
  const LaporanListSuccess(LaporanList? laporanList) : super(laporanList: laporanList);
}

class LaporanListFailed extends LaporanListState {
  const LaporanListFailed(DioError? error) : super(error: error);
}
