import 'package:flutter/material.dart';
import 'package:newsapp/layout/home.dart';

class splashsecreen extends StatelessWidget {
  const splashsecreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home()));
        },
        child: Container(
          width: double.infinity,
          child: Center(child: Image.asset('images/logo.jpg')),
        ),
      ),
    );
  }
}
