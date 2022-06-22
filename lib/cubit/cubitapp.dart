import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/models/businss.dart';
import 'package:newsapp/models/sciences.dart';
import 'package:newsapp/models/sport.dart';
import 'package:newsapp/network/remote/dio.dart';

// ignore: camel_case_types
class appcubit extends Cubit<NewsStates> {
  appcubit() : super(NewsInitialState());
  static appcubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
   List<BottomNavigationBarItem> bootom = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_baseball_sharp), label: 'Sport'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
    //BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  //Color selectcolor = Colors.deepOrange;
  // ignore: non_constant_identifier_names
  void bootomchange(index) {
    currentindex = index;
    /*if (index == 0) {
      getBusinssData();
    }*/
    if (index == 1) {
      getSportDate();
    }
    if (index == 2) {
      getScienssData();
    }
    emit(bootomnavState());
  }

  bool isdark = true;
  ThemeMode appmode = ThemeMode.dark;
  void changemodeapp() {
    isdark = !isdark;
    emit(modechangeapp());
  }

  List<Widget> screens = [
    businss(),
    Sport(),
    science(),
  ];
 
  List<dynamic> businssData = [];
  List<dynamic> sportData = [];
  List<dynamic> scienceData = [];

  void getBusinssData() {
    emit(newslodingStests());
    diohelper.getdata(url: "v2/top-headlines", query: {
      'country': 'us',
      'category': 'business',
      'apiKey': '509f52c1846f44d59a7ce21d6bcff7b9',
    }).then((value) {
      businssData = value.data['articles'];
      emit(newsGetSucessStates());
    }).catchError((error) {
      print(error.toString());
      emit(newserrorgetstates(error.toString()));
    });
  }

  void getSportDate() {
    emit(newslodingsportStests());
    diohelper.getdata(url: "v2/top-headlines", query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '509f52c1846f44d59a7ce21d6bcff7b9',
    }).then((value) {
      sportData = value.data['articles'];
      emit(newsGetsportSucessStates());
    }).catchError((error) {
      print(error.toString());
      emit(newserrorsportgetstates(error.toString()));
    });
  }

  void getScienssData() {
    emit(newslodingsscinessStests());
    diohelper.getdata(url: "v2/top-headlines", query: {
      'country': 'us',
      'category': 'science',
      'apiKey': '509f52c1846f44d59a7ce21d6bcff7b9',
    }).then((value) {
      scienceData = value.data['articles'];
      emit(newsGetscienssSucessStates());
    }).catchError((error) {
      print(error.toString());
      emit(newserrorscienssgetstates(error.toString()));
    });
  }

  List<dynamic> searchnewss = [];
  void searchnews(String value) {
    emit(newslodingsearchStests());
    diohelper.getdata(url: "v2/evreything", query: {
      'q': '$value',
      'apiKey': '509f52c1846f44d59a7ce21d6bcff7b9',
    }).then((value) {
      searchnewss = value.data['articles'];
      emit(newsGetsearchSucessStates());
    }).catchError((error) {
      print(error.toString());
      emit(newserrorsearchgetstates(error.toString()));
    });
  }
}
