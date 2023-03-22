import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomeWork extends StatelessWidget {
  const HomeWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Wow Flutter',
            style: TextStyle(
              fontFamily: 'BungeeInline',
              fontSize: 25,
            ),
          ),
        ),
        body: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Image.network(
              'https://www.afisha.uz/ui/catalog/2015/06/0683657.jpeg'),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: <Widget>[
          const SizedBox(height: 55),
          const DrowerTitle(),
          const Divider(
            color: Colors.white,
            thickness: 4,
            indent: 8,
            endIndent: 20,
          ),
          IconItem(
            icon: Icons.home,
            text: 'Главная',
          ),
          IconItem(
            icon: Icons.coffee,
            text: 'Хотите кофе? :D',
            isActive: true,
          ),
          IconItem(
            icon: Icons.motion_photos_auto_sharp,
            text: 'Мстители',
          ),
          IconItem(
            icon: Icons.spa_outlined,
            text: 'Спа процедуры',
          ),
          Expanded(child: SizedBox()),
          IconItem(
            icon: Icons.close,
            text: 'Типо выход',
            isActive: true,
            isExit: true,
          ),
        ],
      ),
    );
  }
}

class DrowerTitle extends StatelessWidget {
  const DrowerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/image/flutter.png',
          width: 100,
        ),
        Container(
          margin: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Пушкин А. С.',
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    color: Colors.white),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.white,
                height: 3,
                width: 75,
              ),
              const Text(
                'Возраст: 21',
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IconItem extends StatelessWidget {
  IconData icon;
  String text;
  bool isActive;
  bool isExit;

  IconItem({
    Key? key,
    required this.icon,
    required this.text,
    this.isActive = false,
    this.isExit = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? Colors.blueGrey : null,
      padding: !isExit
          ? const EdgeInsets.all(8.0)
          : const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 8,
            ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 16),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
