import 'package:flutter/material.dart';
import 'package:gethubsearch/core/const/const.dart';
import 'package:gethubsearch/features/user_profile/models/user_info_model.dart';
import 'package:gethubsearch/features/user_profile/view/widgets/repos_widget.dart';

import 'main_users_information_widget.dart';

class AnotherUsersProfileInfoMainWidget extends StatelessWidget {
  const AnotherUsersProfileInfoMainWidget(
      {Key? key, required this.anotherUserInfoModel})
      : super(key: key);
  final UserInfoModel anotherUserInfoModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainUsersInformationWidget(
            userInfoModel: anotherUserInfoModel,
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
          ReposWidget(reposUrl: anotherUserInfoModel.reposUrl),
        ],
      ),
    );
  }
}
