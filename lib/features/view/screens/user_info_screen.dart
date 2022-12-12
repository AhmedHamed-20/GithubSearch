import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/core/const/const.dart';
import 'package:gethubsearch/features/models/user_info_model.dart';
import 'package:gethubsearch/features/view/screens/user_followers_following_screen.dart';
import 'package:gethubsearch/features/view_model/cubit/users_cubit.dart';

import '../widgets/more_user_info_widget.dart';
import '../widgets/repos_widget.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key, required this.userInfoModel});
  final UserInfoModel userInfoModel;

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersCubit>(context)
        .getRepositoryInformationByRepositoryUrlAndContributors(
            widget.userInfoModel.reposUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'User Information',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: AppRadius.r70,
              backgroundImage: NetworkImage(
                widget.userInfoModel.userPhotoUrl,
              ),
            ),
            const SizedBox(
              height: AppHeight.h10,
            ),
            Text(
              widget.userInfoModel.userName,
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
                    navigatePushTo(
                        navigateTO: UserFollowerFollowingScreen(
                            isFollower: true,
                            usersLink: widget.userInfoModel.followersUrl),
                        context: context);
                  },
                  child: MoreUserInfoWidget(
                    title: 'Followers',
                    subtitle: widget.userInfoModel.followers.toString(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigatePushTo(
                        navigateTO: UserFollowerFollowingScreen(
                            isFollower: false,
                            usersLink: widget.userInfoModel.followingUrl),
                        context: context);
                  },
                  child: MoreUserInfoWidget(
                    title: 'Following',
                    subtitle: widget.userInfoModel.following.toString(),
                  ),
                ),
                MoreUserInfoWidget(
                  title: 'Repositories',
                  subtitle: widget.userInfoModel.publicRepos.toString(),
                ),
              ],
            ),
            const SizedBox(
              height: AppHeight.h10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: AppHeight.h20,
            ),
            const ReposWidget(),
          ],
        ),
      ),
    );
  }
}
