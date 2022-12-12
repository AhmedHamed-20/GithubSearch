import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/features/view_model/cubit/users_cubit.dart';

import '../../../core/utls/utls.dart';
import '../widgets/other_users_info_card.dart';

class UserFollowerFollowingScreen extends StatefulWidget {
  const UserFollowerFollowingScreen(
      {super.key, required this.isFollower, required this.usersLink});
  final bool isFollower;
  final String usersLink;
  @override
  State<UserFollowerFollowingScreen> createState() =>
      _UserFollowerFollowingScreenState();
}

class _UserFollowerFollowingScreenState
    extends State<UserFollowerFollowingScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.isFollower) {
      BlocProvider.of<UsersCubit>(context).getUserFollowers(widget.usersLink);
    } else {
      BlocProvider.of<UsersCubit>(context).getUserFollowing(widget.usersLink);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          widget.isFollower ? 'Followers' : 'Following',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (widget.isFollower) {
            switch (state.userFollowersRequestStatus) {
              case UserFollowersAndFollowingRequestStatues.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case UserFollowersAndFollowingRequestStatues.success:
                return ListView.builder(
                  itemCount: state.userFollowers.length,
                  itemBuilder: (context, index) {
                    return OtherUsersInfoCard(
                      avatarUrl: state.userFollowers[index].userPhotoUrl,
                      userName: state.userFollowers[index].userName,
                    );
                  },
                );
              case UserFollowersAndFollowingRequestStatues.error:
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
            }
          } else {
            switch (state.userFollowingRequestStatus) {
              case UserFollowersAndFollowingRequestStatues.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case UserFollowersAndFollowingRequestStatues.success:
                return ListView.builder(
                  itemCount: state.userFollowing.length,
                  itemBuilder: (context, index) {
                    return OtherUsersInfoCard(
                      avatarUrl: state.userFollowing[index].userPhotoUrl,
                      userName: state.userFollowing[index].userName,
                    );
                  },
                );
              case UserFollowersAndFollowingRequestStatues.error:
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
            }
          }
        },
      ),
    );
  }
}
