part of 'users_cubit.dart';

class UsersState extends Equatable {
  final UserInfoModel? anotherUserProfile;
  final UserGetByUserHtmlUrlRequestStatues userGetByUserHtmlUrlRequestStatues;
  final List<FollowersFollowingModel> userFollowers;
  final List<FollowersFollowingModel> userFollowing;
  final UserFollowersAndFollowingRequestStatues userFollowersRequestStatus;
  final UserFollowersAndFollowingRequestStatues userFollowingRequestStatus;
  final UserInfoModel? userInfoModel;
  final List<RepositoryInformationModel> repositoryInformationModel;
  final List<UserInfoModel> contributorsList;
  final UserGetByUserNameRequestStatues userGetByUserNameRequestStatues;
  final RepositoryGetByRepositoryUrlRequestStatues
      repositoryGetByRepositoryUrlRequestStatues;
  final RepositoryGetContribuotorsRequestStatues
      repositoryGetContributorsByRepositoryUrlRequestStatues;
  final String errorMessage;

  const UsersState(
      {this.userInfoModel,
      this.userGetByUserHtmlUrlRequestStatues =
          UserGetByUserHtmlUrlRequestStatues.loading,
      this.anotherUserProfile,
      this.userFollowers = const [],
      this.userFollowing = const [],
      this.userFollowersRequestStatus =
          UserFollowersAndFollowingRequestStatues.loading,
      this.userFollowingRequestStatus =
          UserFollowersAndFollowingRequestStatues.loading,
      this.userGetByUserNameRequestStatues =
          UserGetByUserNameRequestStatues.idl,
      this.contributorsList = const [],
      this.repositoryInformationModel = const [],
      this.repositoryGetByRepositoryUrlRequestStatues =
          RepositoryGetByRepositoryUrlRequestStatues.loading,
      this.repositoryGetContributorsByRepositoryUrlRequestStatues =
          RepositoryGetContribuotorsRequestStatues.loading,
      this.errorMessage = ''});
  UsersState copyWith({
    UserGetByUserHtmlUrlRequestStatues? userGetByUserHtmlUrlRequestStatues,
    UserInfoModel? anotherUserProfile,
    List<FollowersFollowingModel>? userFollowers,
    List<FollowersFollowingModel>? userFollowing,
    UserFollowersAndFollowingRequestStatues? userFollowersRequestStatus,
    UserFollowersAndFollowingRequestStatues? userFollowingRequestStatus,
    List<UserInfoModel>? contributorsList,
    List<RepositoryInformationModel>? repositoryInformationModel,
    RepositoryGetByRepositoryUrlRequestStatues?
        repositoryGetByRepositoryUrlRequestStatues,
    RepositoryGetContribuotorsRequestStatues?
        repositoryGetContributorsByRepositoryUrlRequestStatues,
    UserInfoModel? userInfoModel,
    UserGetByUserNameRequestStatues? userGetByUserNameRequestStatues,
    String? errorMessage,
  }) {
    return UsersState(
      userGetByUserHtmlUrlRequestStatues: userGetByUserHtmlUrlRequestStatues ??
          this.userGetByUserHtmlUrlRequestStatues,
      anotherUserProfile: anotherUserProfile ?? this.anotherUserProfile,
      userFollowers: userFollowers ?? this.userFollowers,
      userFollowing: userFollowing ?? this.userFollowing,
      userFollowersRequestStatus:
          userFollowersRequestStatus ?? this.userFollowersRequestStatus,
      userFollowingRequestStatus:
          userFollowingRequestStatus ?? this.userFollowingRequestStatus,
      contributorsList: contributorsList ?? this.contributorsList,
      repositoryInformationModel:
          repositoryInformationModel ?? this.repositoryInformationModel,
      repositoryGetByRepositoryUrlRequestStatues:
          repositoryGetByRepositoryUrlRequestStatues ??
              this.repositoryGetByRepositoryUrlRequestStatues,
      repositoryGetContributorsByRepositoryUrlRequestStatues:
          repositoryGetContributorsByRepositoryUrlRequestStatues ??
              this.repositoryGetContributorsByRepositoryUrlRequestStatues,
      userInfoModel: userInfoModel ?? this.userInfoModel,
      userGetByUserNameRequestStatues: userGetByUserNameRequestStatues ??
          this.userGetByUserNameRequestStatues,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        userGetByUserHtmlUrlRequestStatues,
        anotherUserProfile,
        userFollowers,
        userFollowing,
        userFollowersRequestStatus,
        userFollowingRequestStatus,
        contributorsList,
        repositoryInformationModel,
        repositoryGetByRepositoryUrlRequestStatues,
        repositoryGetContributorsByRepositoryUrlRequestStatues,
        userInfoModel,
        userGetByUserNameRequestStatues,
        errorMessage,
      ];
}
