import 'package:flutter/material.dart';

import '../../../../core/const/const.dart';
import '../../models/user_info_model.dart';
import '../screens/user_followers_following_screen.dart';
import 'more_user_info_widget.dart';

class MainUsersInformationWidget extends StatelessWidget {
  const MainUsersInformationWidget({super.key, required this.userInfoModel});
  final UserInfoModel userInfoModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: AppRadius.r70,
          backgroundImage: NetworkImage(
            userInfoModel.userPhotoUrl,
          ),
        ),
        const SizedBox(
          height: AppHeight.h10,
        ),
        Text(
          userInfoModel.userName,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(
          height: AppHeight.h10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                if (userInfoModel.followers != 0) {
                  navigatePushTo(
                      navigateTO: UserFollowerFollowingScreen(
                          isFollower: true,
                          usersLink: userInfoModel.followersUrl),
                      context: context);
                }
              },
              child: MoreUserInfoWidget(
                title: 'Followers',
                subtitle: userInfoModel.followers.toString(),
              ),
            ),
            InkWell(
              onTap: () {
                if (userInfoModel.following != 0) {
                  navigatePushTo(
                      navigateTO: UserFollowerFollowingScreen(
                          isFollower: false,
                          usersLink: userInfoModel.followingUrl),
                      context: context);
                }
              },
              child: MoreUserInfoWidget(
                title: 'Following',
                subtitle: userInfoModel.following.toString(),
              ),
            ),
            MoreUserInfoWidget(
              title: 'Repositories',
              subtitle: userInfoModel.publicRepos.toString(),
            ),
          ],
        ),
      ],
    );
  }
}
