import 'package:dio/dio.dart';
import 'package:gethubsearch/core/network/dio.dart';
import 'package:gethubsearch/core/network/endpoints.dart';
import 'package:gethubsearch/features/user_profile/models/repository_information_model.dart';
import 'package:gethubsearch/features/user_profile/models/user_info_model.dart';
import 'package:gethubsearch/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:gethubsearch/features/user_profile/repository/base/base_repository.dart';

import '../../models/follower_following_mode.dart';

class RemoteRepositoryImpl extends BaseRepository {
  @override
  Future<Either<Failure, UserInfoModel>> getUserInfoByUserName(
      UserGetInfoParams params) async {
    try {
      final response = await DioHelper.getData(
        url: EndPoints.userByUserName + params.userName,
      );

      return Right(
        UserInfoModel.fromJson(
          response?.data,
        ),
      );
    } on DioError catch (e) {
      return Left(
        ServerFailure(message: e.response?.data['message']),
      );
    }
  }

  @override
  Future<Either<Failure, List<RepositoryInformationModel>>> getUserRepositories(
      RepositoryGetInfoParams params) async {
    try {
      final response = await DioHelper.getData(url: params.repositoryUrl);
      return Right(
        (response?.data as List)
            .map(
              (e) => RepositoryInformationModel.fromJson(e),
            )
            .toList(),
      );
    } on DioError catch (e) {
      return Left(
        ServerFailure(message: e.response?.data['message']),
      );
    }
  }

  @override
  Future<Either<Failure, List<UserInfoModel>>> getRepoContributors(
      RepositoryGetInContributorfoParams params) async {
    try {
      final respone = await DioHelper.getData(url: params.repositoryUrl);
      return Right(
        (respone?.data as List)
            .map(
              (e) => UserInfoModel.fromJson(e),
            )
            .toList(),
      );
    } on DioError catch (e) {
      return Left(
        ServerFailure(message: e.response?.data['message']),
      );
    }
  }

  @override
  Future<Either<Failure, List<FollowersFollowingModel>>> getUserFollowers(
      UserFollowersParams params) async {
    try {
      final response = await DioHelper.getData(url: params.userFollowersLink);
      return Right(
        (response?.data as List)
            .map(
              (e) => FollowersFollowingModel.fromJson(e),
            )
            .toList(),
      );
    } on DioError catch (e) {
      return Left(
        ServerFailure(message: e.response?.data['message']),
      );
    }
  }

  @override
  Future<Either<Failure, List<FollowersFollowingModel>>> getUserFollowing(
      UserFollowingParams params) async {
    try {
      final response = await DioHelper.getData(url: params.userFollowingLink);
      return Right(
        (response?.data as List)
            .map(
              (e) => FollowersFollowingModel.fromJson(e),
            )
            .toList(),
      );
    } on DioError catch (e) {
      return Left(
        ServerFailure(message: e.response?.data['message']),
      );
    }
  }
}
