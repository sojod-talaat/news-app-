import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubitapp.dart';
import 'package:newsapp/cubit/states.dart';
//import 'package:newsapp/layout/home.dart';
//import 'package:newsapp/models/search.dart';
import 'package:newsapp/network/remote/dio.dart';
import 'package:newsapp/splash.dart';

void main() {
  diohelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return appcubit()..changemodeapp();
      },
      child: BlocConsumer<appcubit, NewsStates>(
          listener: (context, stets) {},
          builder: (context, stets) {
            return MaterialApp(
              darkTheme: ThemeData(
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                )),
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.black,
                  selectedItemColor: Color.fromRGBO(92, 67, 59, 0.443),
                  unselectedItemColor: Colors.grey,
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.black45,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  //backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black45,
                    statusBarIconBrightness: Brightness.light,
                  ),

                  iconTheme: IconThemeData(color: Colors.white),
                ),
                // toolbarTextStyle: TextStyle(color: Colors.white)),
                scaffoldBackgroundColor: Colors.black45,
              ),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                //primaryColor: Colors.deepOrange,
                primarySwatch: Colors.deepOrange,
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                ),
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  //backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              // themeMode: ThemeMode.dark,
              themeMode: appcubit.get(context).isdark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: splashsecreen(),
            );
          }),
    );
  }
}
