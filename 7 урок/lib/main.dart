// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(
//     Center(
//       child: Text(
//         'Центр современных професий Proweb',
//         textDirection: TextDirection.ltr,
//         style: TextStyle(
//             // inherit - указывает, будел ли данный стиль наследовать
//             // свойства стиля родительского виджета
//             inherit: false,
//             // Коэффицент высоты текстового элемента. Для определения
//             // высоты элемента этот коэффицент умножается на размер шрифта
//             height: 2,
//             fontSize: 25,
//             // foreground: задает изображение или объект Paint для
//             // закраски текста

//             // shadows: устанавливает тени для шрифта в виде набора объектов
//             // Shadow
//             shadows: [
//               Shadow(
//                 color: Color.fromRGBO(22, 244, 44, 1),
//                 offset: Offset(24, -3),
//               ),
//               Shadow(
//                 color: Color.fromRGBO(100, 4, 255, 1),
//                 offset: Offset(10, 10),
//               ),
//               Shadow(
//                 color: Color.fromRGBO(50, 50, 50, 1),
//                 offset: Offset(10, 55),
//               ),
//             ]

//             // decoration: декорации текста (зачеркивание, подчеркивание
//             // или надчеркивание). Может принимать в качестве значения следующие константы из класса TextDecoration:

//             // TextDecoration.lineThrough: зачеркнутый текст

//             // TextDecoration.overline: подчеркивание над текстом

//             // TextDecoration.underline: подчеркивание под текстом

//             // decorationColor: цвет декораций

//             // decorationStyle: стиль декораций. Представляет перечисление
//             // TextDecorationStyle и может принимать следующие его значения:

//             // TextDecorationStyle.dashed: пунктирная линия

//             // TextDecorationStyle.dotted: точки

//             // TextDecorationStyle.double: двойное подчеркивание

//             // TextDecorationStyle.solid: обычная линия

//             // TextDecorationStyle.wavy: волнистая линия

//             // decorationThickness: толщина декораций
//             ),
//       ),
//     ),
//   );
// }

// void main(List<String> args) {
// // ==================================================================================================================
// // RichText -Виджет RichText позволяет выводить текст с разным стилевым оформлением. Это достигается благодаря тому,
// // что каждый отдельный кусок текста в RichText представляет объект TextSpan, для которого можно настроить свой стиль.
// // ==================================================================================================================

//   const List<TextSpan> _textSpan = [
//     // Прежде всего, текст задается с помощью параметра text, который представляет объект InlineSpan. В реальности,
//     // как правило, этому параметру передается объект класса TextSpan (который унаследован от InlineSpan). По сути
//     // TextSpan - это некий кускок текста.

//     TextSpan(
//       text: 'П',
//       style: TextStyle(color: Colors.red),
//     ),

//     // ==================================================================================================================
//     // Первый параметр - text представляет собственно текст объекта. Но кроме этого, с помощью параметра children можно
//     // вложить дополнительные объекты InlineSpan (в том числе объекты TextSpan), которые также могут содержать текст.
//     // Третий параметр - style позволяет задать для текста определенный стиль.
//     // ==================================================================================================================

//     TextSpan(
//       text: 'ривет',
//       style: TextStyle(
//         color: Color.fromRGBO(100, 10, 255, 1),
//       ),
//     ),
//   ];

//   runApp(
//     Center(
// // ==================================================================================================================
// // Рассмотрим простейший RichText:
// // ==================================================================================================================
//       child: RichText(
//         textDirection: TextDirection.ltr,
//         text: const TextSpan(
//           text: '',
//           children: _textSpan,
//         ),
//       ),
//     ),
//   );
// }

// ==================================================================================================================
// AutoSizeText - тоже самое что и Text, но при этом имеет свойство автоматически менять размер шрифта
// ==================================================================================================================

  // Два вида подключения:

  // auto_size_text: ^3.0.0

  // flutter pub add auto_size_text

// ==================================================================================================================
// StatelessWidgets
// ==================================================================================================================

// Как правило, при создании приложения новые виджеты обычно определяются как подклассы либо класса StatelessWidget,
// либо класса StatefulWidget. В чем разница между ними?

// Виджеты бывают двух видов: stateful (имеют состояние) и stateless (не имеют состояния).

// Виджеты, которые не имеют состояния, (stateless) в процессе работы приложения не изменяют своих свойств. Такие
// виджеты не имеют состояния. Они могут изменяться лишь посредством внешних событий, которые возникают на родительских
// виджетах-контейнерах. И класс StatelessWidget как раз представляет данный тип виджетов.

// Виджеты, которые хранят состояние, (stateful) в процессе работы приложения могут изменять свои свойства динамически.
// Состояние хранится в виде объекта класса State. И класс StatefulWidget представляет виджеты, которые могут хранить
// состояние.

// Вначале рассмотрим, как мы можем работать с классом StatelessWidget.

// Этот класс подходит для создания виджетов, которые не хранят состояние. При создании своего подкласса необходимо
// переопределить метод build(). Этот метод используется для построения интерфейса и вызывается обычно в трех ситуациях:

// когда виджет в первый раз добавляется в дерево виджетов, которое описывает пользовательский интерфейс

// когда контейнер, в котором расположен подкласс StatelessWidget, меняет конфигурацию подкласса StatelessWidget

// когда меняется объект InheritedWidget, от которого зависит подкласс StatelessWidget

void main(List<String> args) {
  runApp(MyApp());
}

// Мое приложение
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          NavBar(),
        ],
      ),
    );
  }
}

// Навигазия на Stateless
class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            // alignment: Alignment.center,
            child: Icon(
              Icons.menu,
              size: 24,
              textDirection: TextDirection.ltr,
            ),
          ),
          Title(
            firstSpan: 'Моё',
            secondSpan: 'приложение',
          ),
          SizedBox(
            width: 60,
            height: 60,
          ),
        ],
      ),
    );
  }
}

// Заголовок на Stateless
class Title extends StatelessWidget {
  String? firstSpan;
  String? secondSpan;

  Title({
    Key? key,
    this.firstSpan = 'Нет ',
    this.secondSpan = 'значения',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> _textSpan = [
      TextSpan(
        text: secondSpan,
        style: TextStyle(color: Colors.red),
      ),
    ];

    return RichText(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        style: TextStyle(
          backgroundColor: Colors.black,
        ),
        text: firstSpan! + ' ',
        children: _textSpan,
      ),
    );
  }
}
