import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/cubit.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:gethubsearch/screens/constance.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  String datafromTextField = '';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var cubit = Appcubit.get(context);

    return BlocBuilder<Appcubit, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xff04040C),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GitHub',
                          style: GoogleFonts.anton(
                            textStyle: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          ' Search',
                          style: GoogleFonts.anton(
                            textStyle: TextStyle(
                              fontSize: 35,
                              color: Color(0xff0698DF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.white,
                        primaryColorDark: Colors.white,
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        onChanged: (val) {
                          datafromTextField = val;
                        },
                        controller: usernameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(35),
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(35),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: "Please type username here",
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    cubit.Error == true
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'username not valid please make sure that username is valid',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ElevatedButton.icon(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      icon: Icon(Icons.search),
                      onPressed: () {
                        String UserName = datafromTextField.trim();
                        usernameController.text = UserName;
                        cubit.getUser(UserName, context);
                      },
                      label: Text('Search'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
