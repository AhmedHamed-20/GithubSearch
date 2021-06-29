import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:gethubsearch/screens/userScreen.dart';

class Appcubit extends Cubit<AppState> {
  Appcubit() : super(AppintiState());
  static Appcubit get(context) => BlocProvider.of(context);

  TextEditingController text = TextEditingController();
  Map<String, dynamic> data = {};
  //List<dynamic> user = [];

  getUser(String userName, BuildContext context) async {
    var response = await Dio()
        .get('https://api.github.com/users/${userName}')
        .then((value) {
      data = Map<String, dynamic>.from(value.data);
      emit(GetUser());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(),
          ));
    }).catchError((onError) {
      print(onError);
    });
  }
}
