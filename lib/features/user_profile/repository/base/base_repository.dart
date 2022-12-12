import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:gethubsearch/core/error/failure.dart';
import 'package:gethubsearch/features/user_profile/models/repository_information_model.dart';

import '../../models/follower_following_mode.dart';
import '../../models/user_info_model.dart';

abstract class BaseRepository {
  Future<Either<Failure, UserInfoModel>> getUserInfoByUserName(
      UserGetInfoParams params);

  Future<Either<Failure, List<RepositoryInformationModel>>> getUserRepositories(
      RepositoryGetInfoParams params);

  Future<Either<Failure, List<UserInfoModel>>> getRepoContributors(
      RepositoryGetInContributorfoParams params);
  Future<Either<Failure, List<FollowersFollowingModel>>> getUserFollowers(
      UserFollowersParams params);
  Future<Either<Failure, List<FollowersFollowingModel>>> getUserFollowing(
      UserFollowingParams params);
}

class UserGetInfoParams extends Equatable {
  final String userName;
  const UserGetInfoParams({required this.userName});
  @override
  List<Object> get props => [userName];
}

class RepositoryGetInfoParams extends Equatable {
  final String repositoryUrl;

  const RepositoryGetInfoParams(this.repositoryUrl);

  @override
  List<Object?> get props => [repositoryUrl];
}

class RepositoryGetInContributorfoParams extends Equatable {
  final String repositoryUrl;

  const RepositoryGetInContributorfoParams(this.repositoryUrl);

  @override
  List<Object?> get props => [repositoryUrl];
}

class UserFollowersParams extends Equatable {
  final String userFollowersLink;

  const UserFollowersParams(this.userFollowersLink);

  @override
  List<Object?> get props => [userFollowersLink];
}

class UserFollowingParams extends Equatable {
  final String userFollowingLink;

  const UserFollowingParams(this.userFollowingLink);

  @override
  List<Object?> get props => [userFollowingLink];
}
