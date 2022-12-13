import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utls/utls.dart';
import '../../view_model/cubit/users_cubit.dart';
import '../widgets/another_users_profile_info_main_widget.dart';

class AnotherUsersInoScreens extends StatefulWidget {
  const AnotherUsersInoScreens({super.key, required this.anotherUserHtmlUrl});
  final String anotherUserHtmlUrl;
  @override
  State<AnotherUsersInoScreens> createState() => _AnotherUsersInoScreensState();
}

class _AnotherUsersInoScreensState extends State<AnotherUsersInoScreens> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersCubit>(context)
        .getAnotherUserProfile(widget.anotherUserHtmlUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'User Profile Informaton',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          switch (state.userGetByUserHtmlUrlRequestStatues) {
            case UserGetByUserHtmlUrlRequestStatues.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case UserGetByUserHtmlUrlRequestStatues.success:
              return AnotherUsersProfileInfoMainWidget(
                anotherUserInfoModel: state.anotherUserProfile!,
              );
            case UserGetByUserHtmlUrlRequestStatues.error:
              return Center(
                child: Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
          }
        },
      ),
    );
  }
}
