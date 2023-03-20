import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gethubsearch/core/network/dio.dart';
import 'package:gethubsearch/features/user_profile/repository/remote/remote_repository_impl.dart';

import '../../features/user_profile/repository/base/base_repository.dart';
import '../../features/user_profile/view_model/cubit/users_cubit.dart';
import '../network/endpoints.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  static initDio() {
    Dio dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
    ));
    serviceLocator.registerLazySingleton<Dio>(() => dio);
    serviceLocator.registerLazySingleton<DioHelper>(() => DioHelper(dio: dio));
  }

  static void init() {
    //cubits
    serviceLocator
        .registerFactory<UsersCubit>(() => UsersCubit(serviceLocator()));

    //repositories
    serviceLocator.registerLazySingleton<BaseRepository>(
        () => RemoteUserProfileRepositoryImpl(serviceLocator()));
  }
}
