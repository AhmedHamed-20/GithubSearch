import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gethubsearch/features/user_profile/models/repository_information_model.dart';
import 'package:gethubsearch/features/user_profile/repository/base/base_repository.dart';

import '../../../../core/utls/utls.dart';
import '../../models/follower_following_mode.dart';
import '../../models/user_info_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.baseRepository) : super(const UsersState());

  final BaseRepository baseRepository;

  Future<void> getUserInfoByUserName(String userName) async {
    emit(state.copyWith(
      userGetByUserNameRequestStatues: UserGetByUserNameRequestStatues.loading,
    ));
    final result = await baseRepository.getUserInfoByUserName(
      UserGetInfoParams(userName: userName),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          userGetByUserNameRequestStatues:
              UserGetByUserNameRequestStatues.error,
          errorMessage: failure.message,
        ));
      },
      (userInfoModel) {
        emit(state.copyWith(
          userGetByUserNameRequestStatues:
              UserGetByUserNameRequestStatues.success,
          userInfoModel: userInfoModel,
        ));
      },
    );
  }

  Future<void> getRepositoryInformationByRepositoryUrlAndContributors(
      String repositoryUrl) async {
    emit(state.copyWith(
      repositoryGetByRepositoryUrlRequestStatues:
          RepositoryGetByRepositoryUrlRequestStatues.loading,
    ));
    final result = await baseRepository.getUserRepositories(
      RepositoryGetInfoParams(repositoryUrl),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          repositoryGetByRepositoryUrlRequestStatues:
              RepositoryGetByRepositoryUrlRequestStatues.error,
          errorMessage: failure.message,
        ));
      },
      (repositoryInformationModel) {
        emit(state.copyWith(
          repositoryGetByRepositoryUrlRequestStatues:
              RepositoryGetByRepositoryUrlRequestStatues.success,
          repositoryInformationModel: repositoryInformationModel,
        ));

        //  getRepoContributors(repositoryInformationModel.contributorsUrl);
      },
    );
  }

  Future<void> getUserFollowers(String userFollowersLink) async {
    emit(state.copyWith(
      userFollowersRequestStatus:
          UserFollowersAndFollowingRequestStatues.loading,
    ));
    final result = await baseRepository
        .getUserFollowers(UserFollowersParams(userFollowersLink));

    result.fold(
      (failure) {
        emit(state.copyWith(
          userFollowersRequestStatus:
              UserFollowersAndFollowingRequestStatues.error,
          errorMessage: failure.message,
        ));
      },
      (userFollowers) {
        emit(state.copyWith(
          userFollowersRequestStatus:
              UserFollowersAndFollowingRequestStatues.success,
          userFollowers: userFollowers,
        ));
      },
    );
  }

  Future<void> getUserFollowing(String userFollowingLink) async {
    emit(state.copyWith(
      userFollowingRequestStatus:
          UserFollowersAndFollowingRequestStatues.loading,
    ));
    final result = await baseRepository
        .getUserFollowers(UserFollowersParams(userFollowingLink));

    result.fold(
      (failure) {
        emit(state.copyWith(
          userFollowingRequestStatus:
              UserFollowersAndFollowingRequestStatues.error,
          errorMessage: failure.message,
        ));
      },
      (userFollowers) {
        emit(state.copyWith(
          userFollowingRequestStatus:
              UserFollowersAndFollowingRequestStatues.success,
          userFollowing: userFollowers,
        ));
      },
    );
  }

  Future<void> getRepoContributors(String repositoryUrl) async {
    final result = await baseRepository.getRepoContributors(
      RepositoryGetInContributorfoParams(repositoryUrl),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
          repositoryGetContributorsByRepositoryUrlRequestStatues:
              RepositoryGetContribuotorsRequestStatues.error,
          errorMessage: failure.message,
        ));
      },
      (repoContributors) {
        emit(state.copyWith(
          repositoryGetContributorsByRepositoryUrlRequestStatues:
              RepositoryGetContribuotorsRequestStatues.success,
          contributorsList: repoContributors,
        ));
      },
    );
  }

  void resetSearchButtonSatatus() {
    emit(state.copyWith(
      userGetByUserNameRequestStatues: UserGetByUserNameRequestStatues.idl,
    ));
  }

  Future<void> getAnotherUserProfile(String userName) async {
    emit(state.copyWith(
      userGetByUserHtmlUrlRequestStatues:
          UserGetByUserHtmlUrlRequestStatues.loading,
    ));
    final result = await baseRepository.getUserInfoByUserName(
      UserGetInfoParams(
        userName: userName,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          userGetByUserHtmlUrlRequestStatues:
              UserGetByUserHtmlUrlRequestStatues.error,
          errorMessage: failure.message,
        ));
      },
      (anotherUserProfile) {
        emit(state.copyWith(
          userGetByUserHtmlUrlRequestStatues:
              UserGetByUserHtmlUrlRequestStatues.success,
          anotherUserProfile: anotherUserProfile,
        ));
      },
    );
  }
}
