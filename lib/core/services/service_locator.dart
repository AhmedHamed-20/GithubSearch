import 'package:get_it/get_it.dart';
import 'package:gethubsearch/features/user_profile/repository/remote/remote_repository_impl.dart';

import '../../features/user_profile/repository/base/base_repository.dart';
import '../../features/user_profile/view_model/cubit/users_cubit.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  static void init() {
    //cubits
    serviceLocator
        .registerFactory<UsersCubit>(() => UsersCubit(serviceLocator()));

    //repositories
    serviceLocator
        .registerLazySingleton<BaseRepository>(() => RemoteRepositoryImpl());
  }
}
