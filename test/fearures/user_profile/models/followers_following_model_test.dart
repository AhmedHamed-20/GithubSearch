import 'package:flutter_test/flutter_test.dart';
import 'package:gethubsearch/features/user_profile/models/follower_following_mode.dart';

import '../repository/remote_user_profile_dumy_data.dart';

void main() {
  group('test followers following model', () {
    test('followers following from json should return follower following model',
        () {
      final followersFollowingModel =
          FollowersFollowingModel.fromJson(tFollowersFollowingMap);
      expect(followersFollowingModel, isA<FollowersFollowingModel>());
      expect(followersFollowingModel.htmlUrl, isA<String>());
      expect(followersFollowingModel.userName, isA<String>());
      expect(followersFollowingModel.userPhotoUrl, isA<String>());
    });
  });
}
