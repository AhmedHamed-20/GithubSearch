import 'package:flutter/material.dart';

class MoreUserInfoWidget extends StatelessWidget {
  const MoreUserInfoWidget(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
