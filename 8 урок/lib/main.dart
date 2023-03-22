// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:template_for_lessons/home_work.dart';

void main(List<String> args) {
  // runApp(MyApp());
  runApp(HomeWork());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Моё приложение',
  //     home: Center(
  //       child: Text('Привет'),
  //     ),
  //   );
  // }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Приложение',
      home: Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        drawer: MyDr(),
        body: Container(),
      ),
    );
  }
}

class MyDr extends StatelessWidget {
  const MyDr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.blueGrey,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.orange,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Image(
                  image: AssetImage('assets/image/flutter.png'),
                ),
                constraints: BoxConstraints.expand(width: 200),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
