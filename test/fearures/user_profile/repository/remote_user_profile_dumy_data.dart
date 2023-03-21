import 'package:dio/dio.dart';
import 'package:gethubsearch/core/network/endpoints.dart';
import 'package:gethubsearch/features/user_profile/models/follower_following_mode.dart';
import 'package:gethubsearch/features/user_profile/models/repository_information_model.dart';
import 'package:gethubsearch/features/user_profile/models/user_info_model.dart';
import 'package:gethubsearch/features/user_profile/repository/base/base_repository.dart';

const Map<String, dynamic> tgetUserByUserNameMap = {
  'name': 'name',
  'login': 'login',
  'avatar_url': 'avatar_url',
  'followers': 1,
  'following': 1,
  'followers_url': 'followers_url',
  'following_url': 'following_url',
  'public_repos': 1,
  'repos_url': 'repos_url',
};
const Map<String, dynamic> tFollowersFollowingMap = {
  'html_url': 'html_url',
  'login': 'login',
  'avatar_url': 'avatar_url',
};
const Map<String, dynamic> tRepositoryInformationMap = {
  'language': 'language',
  'name': 'name',
  'html_url': 'html_url',
  'languages_url': 'languages_url',
  'created_at': 'created_at',
  'updated_at': 'updated_at',
  'contributors_url': 'contributors_url',
};
Response tgetUserByUserNameResponse = Response(
    statusCode: 200,
    data: tgetUserByUserNameMap,
    requestOptions: RequestOptions(path: EndPoints.userByUserName));
Response tGetRepoContributorsResponse = Response(
    statusCode: 200,
    data: [tgetUserByUserNameMap],
    requestOptions: RequestOptions(path: EndPoints.userByUserName));
Response tGetUserFollowersFollowingResponse = Response(
    statusCode: 200,
    data: [tFollowersFollowingMap],
    requestOptions: RequestOptions(path: 'followers_url'));
Response tgetUserRepositoriesResponse = Response(
    statusCode: 200,
    data: [tRepositoryInformationMap],
    requestOptions: RequestOptions(
        path: const RepositoryGetInfoParams('reposUrl').repositoryUrl));
UserInfoModel tUserInfModel = UserInfoModel.fromJson(tgetUserByUserNameMap);
List<FollowersFollowingModel> tFollowersFollowingListModel = [
  FollowersFollowingModel.fromJson(tFollowersFollowingMap)
];
DioError tDioError = DioError(
    response: Response(data: {
      'message': 'message',
    }, requestOptions: RequestOptions(path: EndPoints.userByUserName)),
    requestOptions: RequestOptions(path: EndPoints.userByUserName),
    error: Exception());
List<RepositoryInformationModel> tRepositoryInformationListModel = [
  const RepositoryInformationModel('language', 'reponame', 'repoUrl',
      'repoLanguagesUrl', 'createdAt', 'updatedAt', 'contributorsUrl')
];
