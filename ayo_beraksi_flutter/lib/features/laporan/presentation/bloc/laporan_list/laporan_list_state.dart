part of 'laporan_list_bloc.dart';

abstract class LaporanListState extends Equatable {
  final List<LaporanItem>? laporanList;
  final List<LaporanItem>? alllaporan;
  final DioError? error;

  const LaporanListState({
    this.laporanList,
    this.error,
    this.alllaporan,
  });

  @override
  List<Object?> get props => [laporanList, error];
}

class LaporanListInitial extends LaporanListState {}

class LaporanListSuccess extends LaporanListState {
  const LaporanListSuccess(List<LaporanItem>? laporanList) : super(laporanList: laporanList);
}

class LaporanListFiltered extends LaporanListState {
  const LaporanListFiltered(List<LaporanItem>? laporanList, List<LaporanItem>? allLaporan)
      : super(laporanList: laporanList, alllaporan: allLaporan);
}

class LaporanListFailed extends LaporanListState {
  const LaporanListFailed(DioError? error) : super(error: error);
}
