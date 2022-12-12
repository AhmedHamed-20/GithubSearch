import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/text_editing_controllers.dart';
import '../../../../core/widget/defaults.dart';
import '../../view_model/cubit/users_cubit.dart';

class SearchButtonDesign extends StatelessWidget {
  const SearchButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final usersCubit = BlocProvider.of<UsersCubit>(context);
    return Defaults.defaultButton(
      context: context,
      title: 'Search',
      onPressed: () {
        usersCubit.getUserInfoByUserName(
            TextEditingControllers.userNameController.text);
      },
    );
  }
}
