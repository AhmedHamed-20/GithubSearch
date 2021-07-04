import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:gethubsearch/screens/details_screen.dart';
import 'package:gethubsearch/screens/userScreen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Appcubit extends Cubit<AppState> {
  Appcubit() : super(AppintiState());
  static Appcubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> data = {};
  List<dynamic> details = [];
  //List<dynamic> user = [];
  bool Error = false;
  bool connecthion = true;
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
      Error = false;
      emit(GetUser());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserScreen()),
      );

      //
      //
    }).catchError((onError) {
      print(onError);
      Error = true;
      emit(SearchError());
    });
  }

  getFollowers(String userName, BuildContext context, String type) async {
    var response = await Dio()
        .get('https://api.github.com/users/${userName}/${type}',
            queryParameters: {'per_page': 100},
            options: Options(headers: {
              'Authorization': 'Token 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'
            }))
        .then((value) {
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

  // ignore: cancel_subscriptions

  void checkConnecthion(BuildContext context) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      print('YAY! Free cute dog pics!');

      emit(inInternetConncthion());
      connecthion = true;
    } else {
      print('No internet :( Reason:');
      showDialog(
        builder: (context) => AlertDialog(
          backgroundColor: Colors.grey[850],
          title: Text(
            'Hi',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'NO internet connecthion found',
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        context: context,
      );
      emit(noInternetConncthion());
      connecthion = false;
    }
  }
}
