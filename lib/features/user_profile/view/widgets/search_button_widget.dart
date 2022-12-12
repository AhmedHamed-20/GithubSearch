import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/core/const/const.dart';
import 'package:gethubsearch/features/user_profile/view/screens/user_info_screen.dart';
import 'package:gethubsearch/features/user_profile/view/widgets/search_button_design.dart';
import 'package:gethubsearch/features/user_profile/view_model/cubit/users_cubit.dart';

import '../../../../core/utls/utls.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(listener: (context, state) {
      if (state.userGetByUserNameRequestStatues ==
          UserGetByUserNameRequestStatues.error) {
        flutterToast(
            msg: state.errorMessage,
            backgroundColor: AppColors.toastError,
            textColor: AppColors.white);
      }
      if (state.userGetByUserNameRequestStatues ==
          UserGetByUserNameRequestStatues.notFound) {
        flutterToast(
            msg: 'User not found',
            backgroundColor: AppColors.toastError,
            textColor: AppColors.white);
      }
      if (state.userGetByUserNameRequestStatues ==
          UserGetByUserNameRequestStatues.success) {
        navigatePushTo(
            navigateTO: UserInfoScreen(userInfoModel: state.userInfoModel!),
            context: context);
        //to avoid navigate every time bloc state change
        BlocProvider.of<UsersCubit>(context).resetSearchButtonSatatus();
      }
    }, builder: (context, state) {
      switch (state.userGetByUserNameRequestStatues) {
        case UserGetByUserNameRequestStatues.idl:
          return const SearchButtonDesign();
        case UserGetByUserNameRequestStatues.loading:
          return const Center(child: CircularProgressIndicator());
        case UserGetByUserNameRequestStatues.success:
          return const SearchButtonDesign();
        case UserGetByUserNameRequestStatues.error:
          return const SearchButtonDesign();
        case UserGetByUserNameRequestStatues.notFound:
          return const SearchButtonDesign();
      }
    });
  }
}
