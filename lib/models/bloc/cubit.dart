import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/states.dart';

class Appcubit extends Cubit<AppState> {
  Appcubit() : super(AppintiState());
  static Appcubit get(context) => BlocProvider.of(context);

  TextEditingController text = TextEditingController();

  void getUser(String userName) async {
    try {
      var response =
          await Dio().get('https://api.github.com/users/${userName}');
      print(response);
    } catch (e) {
      print(e);
    }
    emit(GetUser());
  }
}
