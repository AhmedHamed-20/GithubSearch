import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/cubit.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:gethubsearch/screens/web_view.dart';

class DetailsScreen extends StatelessWidget {
  String type;
  DetailsScreen(this.type);
  @override
  Widget build(BuildContext context) {
    var cubit = Appcubit.get(context);
    return BlocBuilder<Appcubit, AppState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Color(0xff04040C),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(type),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: cubit.details.length,
            itemBuilder: (contex, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 13),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        cubit.details[index]['login'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          cubit.details[index]['avatar_url'],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewExample(
                                cubit.details[index]['html_url'],
                              ),
                            ));
                      },
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 10,
                      thickness: 1,
                      indent: 90,
                      endIndent: 50,
                    ),
                  ],
                ),
              );
            }),
      );
    });
  }
}
