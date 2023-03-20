import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/core/services/service_locator.dart';

import 'core/theme/app_theme.dart';
import 'features/user_profile/view/screens/home_screen.dart';
import 'features/user_profile/view_model/cubit/users_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  await ServiceLocator.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<UsersCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Github Search',
        home: const HomeScreen(),
        theme: AppTheme.lightMode,
        darkTheme: AppTheme.darkMode,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
