import 'package:flutter_test/flutter_test.dart';
import 'package:gethubsearch/core/error/failure.dart';
import 'package:gethubsearch/core/network/dio.dart';
import 'package:gethubsearch/features/user_profile/repository/base/base_repository.dart';
import 'package:gethubsearch/features/user_profile/repository/remote/remote_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import 'remote_user_profile_dumy_data.dart';

class MockDioHelper extends Mock implements DioHelper {}

void main() {
  late MockDioHelper mockDioHelper;
  late RemoteUserProfileRepositoryImpl remoteUserProfileRepositoryImpl;
  setUp(() {
    mockDioHelper = MockDioHelper();
    remoteUserProfileRepositoryImpl =
        RemoteUserProfileRepositoryImpl(mockDioHelper);
  });

  group('test remote user profile repository', () {
    test('test getUserInfoByUserName should return UserInfoModel on success',
        () async {
      when(() => mockDioHelper.getData(
              url: any(named: 'url'), headers: any(named: 'headers')))
          .thenAnswer((_) async => tgetUserByUserNameResponse);
      final result =
          (await remoteUserProfileRepositoryImpl.getUserInfoByUserName(
                  const UserGetInfoParams(userName: 'userName')))
              .fold((l) => null, (r) => r);

      expect(result, tUserInfModel);
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });
    test('test getUserInfoByUserName should return server failure on error',
        () async {
      when(() => mockDioHelper.getData(
          url: any(named: 'url'),
          headers: any(named: 'headers'))).thenThrow(tDioError);

      final result =
          (await remoteUserProfileRepositoryImpl.getUserInfoByUserName(
                  const UserGetInfoParams(userName: 'userName')))
              .fold((l) => l, (r) => null);
      expect(result, isA<ServerFailure>());
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });

    test(
        'test getUserRepositories should return List<RepositoryInformationModel> ',
        () async {
      when(() => mockDioHelper.getData(
              url: any(named: 'url'), headers: any(named: 'headers')))
          .thenAnswer((_) async => tgetUserRepositoriesResponse);

      final result = (await remoteUserProfileRepositoryImpl
              .getUserRepositories(const RepositoryGetInfoParams('reposUrl')))
          .fold((l) => null, (r) => r);

      expect(result, tRepositoryInformationListModel);
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });

    test('test getUserRepositories should return server failure on error',
        () async {
      when(() => mockDioHelper.getData(
          url: any(named: 'url'),
          headers: any(named: 'headers'))).thenThrow(tDioError);

      final result = (await remoteUserProfileRepositoryImpl
              .getUserRepositories(const RepositoryGetInfoParams('reposUrl')))
          .fold((l) => l, (r) => null);
      expect(result, isA<ServerFailure>());
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });

    test(
        'test getRepoContributors should return List<RepositoryInformationModel> on success',
        () async {
      when(() => mockDioHelper.getData(
              url: any(named: 'url'), headers: any(named: 'headers')))
          .thenAnswer((_) async => tGetRepoContributorsResponse);

      final result = (await remoteUserProfileRepositoryImpl.getRepoContributors(
              const RepositoryGetInContributorfoParams('reposUrl')))
          .fold((l) => null, (r) => r);
      expect(result, [tUserInfModel]);
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });

    test('test getRepoContributors should return server failure on error',
        () async {
      when(() => mockDioHelper.getData(
          url: any(named: 'url'),
          headers: any(named: 'headers'))).thenThrow(tDioError);

      final result = (await remoteUserProfileRepositoryImpl.getRepoContributors(
              const RepositoryGetInContributorfoParams('reposUrl')))
          .fold((l) => l, (r) => null);
      expect(result, isA<ServerFailure>());
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });
    test(
        'test get user followers should return List<FollowersFollowingModel> on success',
        () async {
      when(() => mockDioHelper.getData(
              url: any(named: 'url'), headers: any(named: 'headers')))
          .thenAnswer((_) async => tGetUserFollowersFollowingResponse);

      final result = (await remoteUserProfileRepositoryImpl
              .getUserFollowers(const UserFollowersParams('followersUrl')))
          .fold((l) => null, (r) => r);

      expect(result, tFollowersFollowingListModel);
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });
    test('test get user followers should return server failure on error',
        () async {
      when(() => mockDioHelper.getData(
          url: any(named: 'url'),
          headers: any(named: 'headers'))).thenThrow(tDioError);

      final result = (await remoteUserProfileRepositoryImpl
              .getUserFollowers(const UserFollowersParams('followersUrl')))
          .fold((l) => l, (r) => null);
      expect(result, isA<ServerFailure>());
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });

    test(
        'test get user following should return List<FollowersFollowingModel> on success',
        () async {
      when(() => mockDioHelper.getData(
              url: any(named: 'url'), headers: any(named: 'headers')))
          .thenAnswer((_) async => tGetUserFollowersFollowingResponse);

      final result = (await remoteUserProfileRepositoryImpl
              .getUserFollowing(const UserFollowingParams('followingUrl')))
          .fold((l) => null, (r) => r);

      expect(result, tFollowersFollowingListModel);
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });

    test('test get user following should return server failure on error',
        () async {
      when(() => mockDioHelper.getData(
          url: any(named: 'url'),
          headers: any(named: 'headers'))).thenThrow(tDioError);

      final result = (await remoteUserProfileRepositoryImpl
              .getUserFollowing(const UserFollowingParams('followingUrl')))
          .fold((l) => l, (r) => null);
      expect(result, isA<ServerFailure>());
      verify(() => mockDioHelper.getData(
          url: any(named: 'url'), headers: any(named: 'headers'))).called(1);
    });
  });
}
