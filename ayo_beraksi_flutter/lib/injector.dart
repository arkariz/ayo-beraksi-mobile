import 'package:ayo_beraksi_flutter/features/laporan/data/datasources/remote/laporan_api_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/repositories/penyuapan_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/pengaduan_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/penyuapan_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/penyuapan/laporan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/remote/login_api_service.dart';
import 'package:ayo_beraksi_flutter/features/login/data/repositories/login_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/get_user_usecases.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/data/datasources/profile_api_service.dart';
import 'package:ayo_beraksi_flutter/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/repositories/profile_repository.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/usecases/change_name_usecase.dart';
import 'package:ayo_beraksi_flutter/features/profile/domain/usecases/change_telepon_usecase.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/name_bloc/name_bloc.dart';
import 'package:ayo_beraksi_flutter/features/profile/presentation/bloc/phone_bloc/phone_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/data/datasources/remote/register_api_service.dart';
import 'package:ayo_beraksi_flutter/features/register/data/repositories/register_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/repositories/register_repository.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/usecases/post_register_usecase.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/laporan/presentation/bloc/pengaduan/pengaduan_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  injector.registerSingleton<UserLocalDataSource>(UserLocalDataSourceImpl());

  // Dependencies
  injector.registerSingleton<LoginApiService>(LoginApiService(injector()));
  injector.registerSingleton<RegisterApiService>(RegisterApiService(injector()));
  injector.registerSingleton<LaporanApiService>(LaporanApiService(injector()));
  injector.registerSingleton<ProfileApiService>(ProfileApiService(injector()));

  injector.registerSingleton<LoginRepository>(LoginRepositoryImpl(injector(), injector()));
  injector.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(injector()));
  injector.registerSingleton<LaporanRepository>(LaporanRepositoryImpl(injector(), injector()));
  injector.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(injector(), injector()));

  // UseCases
  injector.registerSingleton<GetUserUseCase>(GetUserUseCase(injector()));
  injector.registerSingleton<PostRegisterUseCase>(PostRegisterUseCase(injector()));

  injector.registerSingleton<PenyuapanUseCase>(PenyuapanUseCase(injector()));
  injector.registerSingleton<PengaduanUseCase>(PengaduanUseCase(injector()));

  injector.registerSingleton<ChangeNameUseCase>(ChangeNameUseCase(injector()));
  injector.registerSingleton<ChangeTeleponUseCase>(ChangeTeleponUseCase(injector()));

  // Blocs
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  injector.registerFactory<RegisterBloc>(() => RegisterBloc(injector()));

  injector.registerFactory<LaporanBloc>(() => LaporanBloc(injector()));
  injector.registerFactory<PengaduanBloc>(() => PengaduanBloc(injector()));

  injector.registerFactory<NameBloc>(() => NameBloc(injector()));
  injector.registerFactory<PhoneBloc>(() => PhoneBloc(injector()));
}
