import 'package:flutter/material.dart';
import 'package:gethubsearch/core/const/const.dart';
import 'package:gethubsearch/features/user_profile/models/user_info_model.dart';

import '../widgets/main_users_information_widget.dart';
import '../widgets/repos_widget.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key, required this.userInfoModel});
  final UserInfoModel userInfoModel;

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
            MainUsersInformationWidget(
              userInfoModel: userInfoModel,
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
            ReposWidget(reposUrl: userInfoModel.reposUrl),
          ],
        ),
      ),
    );
  }
}
