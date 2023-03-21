import 'package:flutter_test/flutter_test.dart';
import 'package:gethubsearch/features/user_profile/models/user_info_model.dart';

import '../repository/remote_user_profile_dumy_data.dart';

void main() {
  group('test user info model', () {
    test('from json should return user info model', () {
      final userInfoModel = UserInfoModel.fromJson(tgetUserByUserNameMap);
      expect(userInfoModel, isA<UserInfoModel>());
      expect(userInfoModel.userName, isA<String>());
      expect(userInfoModel.userPhotoUrl, isA<String>());
      expect(userInfoModel.followers, isA<int>());
      expect(userInfoModel.following, isA<int>());
      expect(userInfoModel.publicRepos, isA<int>());
      expect(userInfoModel.followingUrl, isA<String>());
      expect(userInfoModel.followersUrl, isA<String>());
      expect(userInfoModel.reposUrl, isA<String>());
      expect(userInfoModel.name, isA<String>());
    });
  });
}
