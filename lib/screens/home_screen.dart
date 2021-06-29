import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/models/bloc/cubit.dart';
import 'package:gethubsearch/models/bloc/states.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var cubit = Appcubit.get(context);
    return BlocBuilder<Appcubit, AppState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    Text(
                      'GitHub Search',
                      style: GoogleFonts.anton(
                        textStyle: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    TextField(
                      onSubmitted: (val) {
                        cubit.text.text = val;
                      },
                      onChanged: (val) {
                        cubit.text.text = val;
                      },
                      controller: cubit.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(35),
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Please type username here",
                          fillColor: Colors.white70),
                    ),
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
                        String user = cubit.text.text.trim();
                        cubit.getUser(user, context);
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
