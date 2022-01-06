import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/remote/login_api_service.dart';
import 'package:ayo_beraksi_flutter/features/login/data/repositories/login_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/get_user_usecases.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<LoginApiService>(LoginApiService(injector()));
  // injector.registerSingleton<UserLocalDataSource>(UserLocalDataSource(injector()));
  injector.registerSingleton<LoginRepository>(LoginRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<GetUserUseCase>(GetUserUseCase(injector()));

  // injector.registerSingleton<SharedPreferences>(SharedPreferences(injector()));

  // Blocs
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
}
