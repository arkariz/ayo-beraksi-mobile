import 'package:ayo_beraksi_flutter/features/login/data/datasources/remote/login_api_service.dart';
import 'package:ayo_beraksi_flutter/features/login/data/repositories/login_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/get_user_usecases.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/register/data/datasources/remote/register_api_service.dart';
import 'package:ayo_beraksi_flutter/features/register/data/repositories/register_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/repositories/register_repository.dart';
import 'package:ayo_beraksi_flutter/features/register/domain/usecases/post_register_usecase.dart';
import 'package:ayo_beraksi_flutter/features/register/presentation/bloc/register_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<LoginApiService>(LoginApiService(injector()));
  injector.registerSingleton<RegisterApiService>(RegisterApiService(injector()));
  // injector.registerSingleton<UserLocalDataSource>(UserLocalDataSource(injector()));
  injector.registerSingleton<LoginRepository>(LoginRepositoryImpl(injector()));
  injector.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(injector()));

  // UseCases
  injector.registerSingleton<GetUserUseCase>(GetUserUseCase(injector()));
  injector.registerSingleton<PostRegisterUseCase>(PostRegisterUseCase(injector()));

  // injector.registerSingleton<SharedPreferences>(SharedPreferences(injector()));

  // Blocs
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector()));
  injector.registerFactory<RegisterBloc>(() => RegisterBloc(injector()));
}
