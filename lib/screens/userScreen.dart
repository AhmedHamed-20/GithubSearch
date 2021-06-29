import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/cubit.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:gethubsearch/screens/web_view.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);
    return BlocBuilder<Appcubit, AppState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Color(0xff04040C),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'GitHub account',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Column(
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white70,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          cubit.data['avatar_url'],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(
                          color: Color(0xffF9F2E4),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'UserName',
                        style: TextStyle(
                          color: Color(0xff0698DF),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                          color: Color(0xffF9F2E4),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${cubit.data['following']},',
                        style: TextStyle(
                          color: Color(0xffF9F2E4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cubit.data['login'],
                        style: TextStyle(
                          color: Color(0xffF9F2E4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${cubit.data['followers']}',
                        style: TextStyle(
                          color: Color(0xffF9F2E4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Card(
                    color: Color(0xff0698DF).withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name: ',
                                style: TextStyle(
                                    color: Color(0xffF9F2E4),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${cubit.data['name']}',
                                style: TextStyle(
                                  color: Color(0xffF9F2E4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Bio:    ',
                                style: TextStyle(
                                    color: Color(0xffF9F2E4),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${cubit.data['bio']}',
                                style: TextStyle(
                                  color: Color(0xffF9F2E4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'Location: ',
                                style: TextStyle(
                                    color: Color(0xffF9F2E4),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${cubit.data['location']}',
                                style: TextStyle(
                                  color: Color(0xffF9F2E4),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Webview(cubit.data['html_url']),
                                      ));
                                },
                                child: Text(
                                  'Go to account page',
                                  style: TextStyle(
                                      color: Color(0xff0698DF),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
