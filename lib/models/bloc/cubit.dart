import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:gethubsearch/screens/details_screen.dart';
import 'package:gethubsearch/screens/userScreen.dart';

class Appcubit extends Cubit<AppState> {
  Appcubit() : super(AppintiState());
  static Appcubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> data = {};
  List<dynamic> details = [];
  //List<dynamic> user = [];
  bool Error = false;
  getUser(String userName, BuildContext context) async {
    var response;
    //  Dio().options.headers['User-Agent'] = 'request';
    response = await Dio()
        .get('https://api.github.com/users/${userName}',
            options: Options(headers: {
              'Authorization': 'Token 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'
            }))
        .then((value) {
      data = Map<String, dynamic>.from(value.data);
      emit(GetUser());
      Error = false;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(),
          ));
    }).catchError((onError) {
      print(onError);
      Error = true;
      emit(SearchError());
    });
  }

  getFollowers(String userName, BuildContext context, String type) async {
    var response = await Dio().get(
        'https://api.github.com/users/${userName}/${type}',
        queryParameters: {'per_page': 100}).then((value) {
      details = value.data;
      emit(detailsScreen());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(type),
          ));
    }).catchError((onError) {
      print(onError);
    });
  }
}
