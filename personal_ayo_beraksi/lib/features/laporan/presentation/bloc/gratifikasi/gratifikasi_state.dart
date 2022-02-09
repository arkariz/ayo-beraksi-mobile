part of 'gratifikasi_bloc.dart';

abstract class GratifikasiState extends Equatable {
  final Gratifikasi? gratifikasi;
  final DioError? error;

  const GratifikasiState({this.gratifikasi, this.error});

  @override
  List<Object?> get props => [gratifikasi, error];
}

class GratifikasiInitial extends GratifikasiState {}

class GratifikasiSuccess extends GratifikasiState {
  const GratifikasiSuccess(Gratifikasi? gratifikasi) : super(gratifikasi: gratifikasi);
}

class GratifikasiFailed extends GratifikasiState {
  const GratifikasiFailed(DioError? error) : super(error: error);
}
