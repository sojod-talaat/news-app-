import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/cubitapp.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/shared/component/newsscreen.dart';

class Search extends StatelessWidget {
  var searchcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = appcubit.get(context).searchnewss;
          return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: searchcontroler,
                      onChanged: (value) {
                        appcubit.get(context).searchnews(value);
                      },
                      decoration: InputDecoration(
                        // border:BorderRadius()
                        label: Text('search '),
                        prefix: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(width:50),
                  Expanded(
                    child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => news(list[index], context),
                  separatorBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.grey[300],
                    );
                  },
                  itemCount: 20),
                  ),
                ],
              ));
        });
  }
}
