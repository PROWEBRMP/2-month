import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/* 
Flutter представляет фреймворк от компании Google, который позволяет создавать кроссплатформенные приложения, 
которые могут использовать однин и тот же код. Спектр платформ широк - это веб-приложения, мобильные приложения под Android и iOS, 
графические приложения под настольные операционные системы Windows, MacOS, Linux, а также веб-приложения.

Особенностью работы с Flutter является то, что приложения под разные платформы могут иметь один и тот же код.
 Поскольку используемые платформы не эквиваленты, то какие-то отдельные части кода необходимо настраивать под определенную ОС, 
 например, под iOS, но тем не менее большая часть кода может совпадать. Это позволяет разработчикам существенно сэкономить время 
 и ресурсы на создание приложений под все поддерживаемые платформы.

В качестве языка разработки используется язык программирования Dart.
При постороении приложения Flutter транслирует код на Dart в нативный 
код приложения с помощью Dart AOT (компиляция приложения перед его запуском), 
которое можно запускать на Android или iOS или другой платформе. Однако при разработке приложения для ее ускорения 
Flutter использует JIT (компиляция приложения в процессе его запуска).

Создание приложения на Windows
Прежде всего создадим для проектов Flutter каталог на жестком диске. Например, в моем случае это каталог C:\fluttersrc.

Откроем командную строку/консоль и перейдем к созданному каталогу с помощью команды cd. Далее введем следующую команду:

flutter create myapp

Данная команда создает в текущей папке проект под названием myapp.

В результате будет создан большой проект с довольно сложной структурой

Основные элементы структуры проекта:

Папка .dart-tool - специальная папка, которая хранит информацию об используемых пакетах

Папка .idea - специальная папка для Android Studio, которая содержит базовую конфигурацию

Папка android содержит код и дополнительные файлы, которые позволяют связать прложение на Dart с Android

Папка ios содержит код и дополнительные файлы, которые позволяют связать приложение на Dart с iOS

Папка buid содержит файлы, создаваемые в результате процесса построения приложения

Папка lib содержит собственно файлы приложения на языке Dart. Именно с этой папкой идет основная работа при создания приложения на Flutter

Папка test предназначена для хранения файлов с тестами

Папка web содержит код и дополнительные файлы для создания веб-приложения на Flutter

Файл pubsec.yaml хранит конфигурацию проекта, в частности, пакет проекта, список зависимостей и т.д.

Этот проект уже содержит самый минимальный функционал, который мы можем запускать.

Для запуска и тестирования приложения мы можем использовать эмуляторы или реальные устройства. Для запуска веб-приложений на Flutter в качестве условных "устройств" используются браузеры. Для тестирования десктоп-приложений - текущий компьютер.

Для проверки наличия устройства для запуска проекта можно выполнить в командной строке/консоли следующую команду:

flutter devices

 */