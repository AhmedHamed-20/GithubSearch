import 'package:flutter/material.dart';
import 'package:gethubsearch/core/const/const.dart';

class OtherUsersInfoCard extends StatelessWidget {
  const OtherUsersInfoCard(
      {super.key, required this.avatarUrl, required this.userName});
  final String userName;
  final String avatarUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: ListTile(
            leading: CircleAvatar(
              radius: AppRadius.r40,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            title: Text(
              userName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
