import 'package:ayo_beraksi_flutter/features/laporan/data/datasources/remote/laporan_api_service.dart';
import 'package:ayo_beraksi_flutter/features/laporan/data/repositories/laporan_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/repositories/laporan_repository.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/feedback_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/gratifikasi_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/laporanlist_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/pengaduan_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/domain/usecases/penyuapan_usecase.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/feedback/feedback_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/gratifikasi/gratifikasi_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/penyuapan/laporan_bloc.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/local/user_local_data_source.dart';
import 'package:ayo_beraksi_flutter/features/login/data/datasources/remote/login_api_service.dart';
import 'package:ayo_beraksi_flutter/features/login/data/repositories/login_repository_impl.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/repositories/login_repository.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/delete_user_usecase.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/get_cache_user_usecase.dart';
import 'package:ayo_beraksi_flutter/features/login/domain/usecases/get_user_usecases.dart';
import 'package:ayo_beraksi_flutter/features/login/presentation/bloc/login_bloc.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/hiveBox/notification_box.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/local/notification_local_datasource.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/datasources/remote/notification_api_service.dart';
import 'package:ayo_beraksi_flutter/features/notification/data/models/notification_model.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/repositories/notification_repository.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/delete_notification_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/get_all_notification_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/post_fcm_token_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/save_notification_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/usecases/update_notification_usecase.dart';
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/fcm/fcm_bloc.dart';
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
import 'package:ayo_beraksi_flutter/core/widgets/search/bloc/search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/laporan/presentation/bloc/pengaduan/pengaduan_bloc.dart';
import 'features/notification/data/repositories/notification_repository_impl.dart';
import 'features/notification/presentation/bloc/notification/notification_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  //Hive
  await Hive.initFlutter();
  injector.registerSingleton<NotificationBox>(NotificationBox());

  //Local Datasource
  injector.registerSingleton<UserLocalDataSource>(UserLocalDataSourceImpl());
  injector
      .registerSingleton<NotificationLocalDataSource<NotificationModel>>(NotificationLocalDataSourceImpl(injector()));

  //Remote Datasource
  injector.registerSingleton<LoginApiService>(LoginApiService(injector()));
  injector.registerSingleton<RegisterApiService>(RegisterApiService(injector()));
  injector.registerSingleton<LaporanApiService>(LaporanApiService(injector()));
  injector.registerSingleton<ProfileApiService>(ProfileApiService(injector()));
  injector.registerSingleton<NotificationApiService>(NotificationApiService(injector()));

  //Repository
  injector.registerSingleton<LoginRepository>(LoginRepositoryImpl(injector(), injector()));
  injector.registerSingleton<RegisterRepository>(RegisterRepositoryImpl(injector()));
  injector.registerSingleton<LaporanRepository>(LaporanRepositoryImpl(injector(), injector()));
  injector.registerSingleton<ProfileRepository>(ProfileRepositoryImpl(injector(), injector()));
  injector.registerSingleton<NotificationRepository>(NotificationRepositoryImpl(injector(), injector(), injector()));

  // UseCases
  injector.registerSingleton<GetUserUseCase>(GetUserUseCase(injector()));
  injector.registerSingleton<GetCacheUserUceCase>(GetCacheUserUceCase(injector()));
  injector.registerSingleton<DeleteUserUseCase>(DeleteUserUseCase(injector()));
  injector.registerSingleton<PostRegisterUseCase>(PostRegisterUseCase(injector()));
  injector.registerSingleton<PostFcmTokenUseCase>(PostFcmTokenUseCase(injector()));

  injector.registerSingleton<PenyuapanUseCase>(PenyuapanUseCase(injector()));
  injector.registerSingleton<PengaduanUseCase>(PengaduanUseCase(injector()));
  injector.registerSingleton<GratifikasiUseCase>(GratifikasiUseCase(injector()));
  injector.registerSingleton<FeedbackUseCase>(FeedbackUseCase(injector()));
  injector.registerSingleton<LaporanListUsecase>(LaporanListUsecase(injector()));

  injector.registerSingleton<ChangeNameUseCase>(ChangeNameUseCase(injector()));
  injector.registerSingleton<ChangeTeleponUseCase>(ChangeTeleponUseCase(injector()));

  injector.registerSingleton<SaveNotificationUseCase>(SaveNotificationUseCase(injector()));
  injector.registerSingleton<GetAllNotificationUseCase>(GetAllNotificationUseCase(injector()));
  injector.registerSingleton<UpdateNotificationUsecase>(UpdateNotificationUsecase(injector()));
  injector.registerSingleton<DeleteNotificationUsecase>(DeleteNotificationUsecase(injector()));

  // Blocs
  injector.registerFactory<LoginBloc>(() => LoginBloc(injector(), injector(), injector()));
  injector.registerFactory<RegisterBloc>(() => RegisterBloc(injector()));
  injector.registerFactory<NotificationBloc>(() => NotificationBloc(injector(), injector(), injector(), injector()));
  injector.registerFactory<FcmBloc>(() => FcmBloc(injector()));
  injector.registerFactory<SearchBloc>(() => SearchBloc(injector()));

  injector.registerFactory<LaporanBloc>(() => LaporanBloc(injector()));
  injector.registerFactory<PengaduanBloc>(() => PengaduanBloc(injector()));
  injector.registerFactory<GratifikasiBloc>(() => GratifikasiBloc(injector()));
  injector.registerFactory<FeedbackBloc>(() => FeedbackBloc(injector()));
  injector.registerFactory<LaporanListBloc>(() => LaporanListBloc(injector()));

  injector.registerFactory<NameBloc>(() => NameBloc(injector()));
  injector.registerFactory<PhoneBloc>(() => PhoneBloc(injector()));
}