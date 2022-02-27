import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubitapp.dart';
import 'package:newsapp/cubit/states.dart';

import '../models/search.dart';

// ignore: camel_case_types
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = appcubit.get(context);
          cubit.getBusinssData();

          return Scaffold(
            appBar: AppBar(
              titleSpacing: 20.0,
              title: Text(
                'News App',
                style: TextStyle(fontSize: 20),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cubit.changemodeapp();
                    },
                    icon: Icon(Icons.dark_mode_outlined)),
              ],
            ),
            body: cubit.screens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.bootomchange(value);
              },
              items: cubit.bootom,
            ),
          );
        });
  }
}
