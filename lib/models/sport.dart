import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubitapp.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/shared/component/newsscreen.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = appcubit.get(context).sportData;
        return Scaffold(
          body: list.length == 0
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => news(list[index], context),
                  separatorBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    );
                  },
                  itemCount: 10),
        );
      },
    );
  }
}
