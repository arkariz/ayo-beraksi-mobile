part of 'laporan_list_bloc.dart';

abstract class LaporanListEvent extends Equatable {
  const LaporanListEvent();

  @override
  List<Object> get props => [];
}

class GetLaporanList extends LaporanListEvent {}
