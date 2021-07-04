import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/cubit.dart';
import 'package:gethubsearch/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Appcubit>(create: (BuildContext context) => Appcubit()),
      ],
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
