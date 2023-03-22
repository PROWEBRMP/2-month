// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lesson_6/home_work.dart';

// ==================================================================================================================
// Контейнеры и Компоновка сразу нескольких элементов
// ==================================================================================================================

// ==================================================================================================================
// ConstrainedBox
// ==================================================================================================================

// Виджет ConstrainedBox задает параметры прямоугольной области (ширину и высоту), в которой размещается вложенный виджет.
// Для создания объекта ConstrainedBox применяется следующий конструктор:

// ConstrainedBox({Key key, @required BoxConstraints constraints, Widget child})
// Обязательный параметр constraints представляет класс BoxConstraints, который имеет следующие конструкторы:

// BoxConstraints({double minWidth: 0.0, double maxWidth: double.infinity,
//double minHeight: 0.0, double maxHeight: double.infinity}):
// получает минимальную ширину (minWidth), максимальную ширину (maxWidth),
//минимальную (minHeight) и максимальную (maxHeight) высоту

// BoxConstraints.expand({double width, double height}): принимает ширину и длину, до которых может растягиваться контейнер

// BoxConstraints.loose(Size size): создает контейнер, который должен иметь размер не больше, чем параметр size

// BoxConstraints.tight(Size size): создает контейнер, который должен иметь в точности тот же размер, что и параметр size

// BoxConstraints.tightFor({double width, double height}): принимает точные значения ширины и длины, которые должен иметь контейнер

// BoxConstraints.tightForFinite({double width: double.infinity, double height: double.infinity}): принимает точные значения ширины и длины, если они не равны double.infinity

// Данный тип контейнеров применяется, когда нам надо ограничить виджет определенной областью.

// Например, виджет Text по умолчанию растягивается по всей длине и ширине контейнера:

// void main() {
//   runApp(
//     Center(
//       child: Text(
//         'Hello Flutter from ProWeb',
//         textDirection: TextDirection.ltr,
//         textAlign: TextAlign.center, // текст по центру
//         style: TextStyle(
//           fontSize: 26,
//         ), // высота шрифта 26
//       ),
//     ),
//   );
// }

// Установка ширины и высоты ConstrainedBox в Flutter
// Используем ConstrainedBox, чтобы ограничить область текста на экране:

// void main() {
//   runApp(
//     Center(
//       child: ConstrainedBox(
//         constraints: BoxConstraints.tightFor(width: 300, height: 100),
//         child: Text(
//           'Hello Flutter from ProWeb',
//           textDirection: TextDirection.ltr,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 26), // высота шрифта 26
//         ),
//       ),
//     ),
//   );
// }

// В данном случае с помощью конструктора BoxConstraints.tightFor(width: 300, height: 100) область ConstrainedBox и
// соответственно его содержимого ограничивается прямоугольником шириной 300 и высотой в 100 единиц.

// BoxConstraints и установка размеров в Flutter
// Если содержимое виджета занимает больше места, то оно усекается до видимой области.
// Например, попробуем вывести многострочный текст:

// void main() {
//   runApp(
//     Center(
//       child: ConstrainedBox(
//         constraints: BoxConstraints.tightFor(width: 18, height: 80),
//         child: Text(
//           'Мы все учились понемногу\nЧему-нибудь и как-нибудь,\nТак воспитаньем, слава богу,\nУ нас немудрено блеснуть.',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize: 22,
//           ), // высота шрифта 22
//         ),
//       ),
//     ),
//   );
// }

// В данном случае последняя строка не впишеется в отведенную для виджета область, поэтому мы ее не увидим:
// Ограничение размеров виджетов в Flutter

// ==================================================================================================================
// Container
// ==================================================================================================================

// Container представляет такой виджет, который также может содержать только один вложенный элемент, но при этом
// предоставляет дополнительные возможности по настройке фона, позиционирования и размера вложенных виджетов.
// По сути Container объединяет возможности других виджетов - Padding, Align, ConstrainedBox.

// Конструктор контейнера принимает довольно много параметров, которые позвляют настроить отдельные аспекты отображения:

// Container({Key key, AlignmentGeometry alignment, EdgeInsetsGeometry padding, Color color, Decoration decoration,
// Decoration foregroundDecoration, double width, double height, BoxConstraints constraints, EdgeInsetsGeometry margin,
// Matrix4 transform, Widget child, Clip clipBehavior: Clip.none})
// Рассмотрим некоторые параметры:

// key: ключ элемента

// alignment: настройки выравнивания вложенного элемента в виде объекта AlignmentGeometry,
// аналогично настройке выравнивания в виджете Align

// padding: настройки отступа вложенного элемента от границ контейнера, аналогично настройке
// отступов в виджете Padding

// color: цвет контейнера

// constraints: ограничения длины и ширины в виде объекта BoxConstraints, применяемые к вложенному
// виджету. Аналогично установке размеров в ConstrainedBox

// margin: устанавливает отступы текущего виджета Container от границ внешнего контейнера,
// аналогично настройке параметра padding

// width: ширина контейнера

// heigt: высота контейнера

// Создадим простейший виджет Container:

// void main() {
//   runApp(Container(
//       color: Colors.lightBlueAccent,
//       alignment: Alignment.center,
//       child: Text(
//         'Hello Flutter from ProWeb',
//           textDirection: TextDirection.ltr
//         )
//       )
//   );
// }

// Виджет Container в Flutter
// В данном случае в качестве цвета использован встроенный цвет (оттенок светло-синего цвета),
// описывамый значением Colors.lightBlueAccent. По выравниванию установлено центрирование вложенного
// виджета с помощью значения Alignment.center.

// Отступы margin и padding
// Теперь рассмотрим применение отступов как для margin, так и для padding:

// void main() {
//   runApp(Container(
//       color: Colors.lightBlue,
//       alignment: Alignment.topLeft,
//       padding: EdgeInsets.all(40),
//       margin: EdgeInsets.only(top:30),
//       child: Text(
//         'Hello Flutter from ProWeb',
//           textDirection: TextDirection.ltr
//         )
//       )
//   );
// }

// Отступы padding и margin в Container в Flutter
// В данном случае в качестве значения для margin установлен с верху отступ в 30 единиц.
// То есть виджет Container будет располагаться на 30 единиц ниже верхней границы экрана.
// Поэтому в верху экрана смартфона мы увидим черную полоску, которая не заполнена виджетом Container.

// Также установлен отступ для вложенного виджета Text относительно границ Container в 40 единиц.

// ==================================================================================================================
// Column
// ==================================================================================================================

// Контейнер Column располагает элементы вертикально, в виде столбика.

// Для создания виджета применяется следующий конструктор:

// Column({Key key, MainAxisAlignment mainAxisAlignment: MainAxisAlignment.start, MainAxisSize mainAxisSize: MainAxisSize.max,
// CrossAxisAlignment crossAxisAlignment: CrossAxisAlignment.center, TextDirection textDirection,
// VerticalDirection verticalDirection: VerticalDirection.down, TextBaseline textBaseline, List<Widget> children: const []})

// Его параметры:
// ==================================================================================================================

// key: ключ виджета
// ==================================================================================================================
// mainAxisAlignment: задает выравнивание по вертикали
// ==================================================================================================================
// mainAxisSize: задает пространство, занимаемое виджетом по основной оси
// ==================================================================================================================
// crossAxisAlignment: задает выравнивание по горизонтали
// ==================================================================================================================
// textDirection: определяет порядок расположения вложенных элементов по горизонтали
// ==================================================================================================================
// verticalDirection: определяет порядок расположения вложенных элементов по вертикали
// ==================================================================================================================
// textBaseline: устанавливает базовую линию для выравнивания элементов
// ==================================================================================================================
// children: набор вложенных элементов
// ==================================================================================================================

// Простейший виджет Column:

// void main() {
//   runApp(Container(
//     padding: EdgeInsets.all(30),
//     color: Colors.teal,
//     child:Column(
//         children: <Widget>[
//           Text('Вот мысль, которой весь я предан,',
//               textDirection: TextDirection.ltr),
//           Text('Итог всего, что ум скопил.',
//               textDirection: TextDirection.ltr),
//           Text('Лишь тот, кем бой за жизнь изведан,',
//               textDirection: TextDirection.ltr),
//           Text('Жизнь и свободу заслужил.',
//               textDirection: TextDirection.ltr)
//         ],
//       )
//     )
//   );
// }

// Column в Flutter
// Стоит учитывать, что виджет Column не поддерживает прокрутку.
// Поэтому если необходимо обеспечить доступ к виджетам, которые выходят за пределы видимо пространства,
// то вместо Column лучше использовать другой контейнер, например, ListView.

// CrossAxisAlignment
// ==================================================================================================================
// Параметр crossAxisAlignment в конструкторе Column указывает, как вложенные виджеты будут располагаться по
// пересекающей оси - в данном случае по горизонтали. Этот параметр может принимать следующие значения:
// ==================================================================================================================
// CrossAxisAlignment.center: значение по умолчанию, располагает вложенные элементы по центру по горизонтали.
// Аналогично значению CrossAxisAlignment(2).
// ==================================================================================================================
// CrossAxisAlignment.end: располагает вложенные элементы в конце горизонтальной оси. В Column,
// если другой параметр конструктора textDirection равен TextDirection.ltr (то есть текст слева направо),
// то элементы выравниваются по правому краю. А если он равен TextDirection.rtl (то есть текст справа налево),
// то элементы выравниваются по левому краю. Аналогично значению CrossAxisAlignment(1).
// ==================================================================================================================
// CrossAxisAlignment.start: располагает вложенные элементы в начале пересекающей оси. В Column, если другой параметр
// конструктора textDirection равен TextDirection.ltr (то есть текст слева направо), то элементы выравниваются по
// левому краю. Аналогично значению CrossAxisAlignment(0).
// ==================================================================================================================
// CrossAxisAlignment.stretch: растягивает вложенные элементы по всей ширине контейнера Column. Аналогично значению
// CrossAxisAlignment(3).
// ==================================================================================================================
// CrossAxisAlignment.baseline: выравнивает вложенные элементы по базовой линии - пересекающей оси. Аналогично
// значению CrossAxisAlignment(4). Для контейнера Column фактически аналогично значению CrossAxisAlignment.start.
// Требует установки параметра textBaseline
// ==================================================================================================================
// В первом примере, как видно из скриншота, по умолчанию применяется CrossAxisAlignment.center,
// то есть все вложенные виджеты центрируются. Используем другое значение:

// void main() {
//   runApp(Container(
//     padding: EdgeInsets.all(30),
//     color: Colors.teal,
//     child:Column(
//         textDirection: TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text('Вот мысль, которой весь я предан,',
//               textDirection: TextDirection.ltr),
//           Text('Итог всего, что ум скопил.',
//               textDirection: TextDirection.ltr),
//           Text('Лишь тот, кем бой за жизнь изведан,',
//               textDirection: TextDirection.ltr),
//           Text('Жизнь и свободу заслужил.',
//               textDirection: TextDirection.ltr)
//         ],
//       )
//     )
//   );
// }

// С помощью значения crossAxisAlignment: CrossAxisAlignment.start задается выравнивание по левому краю контейнера.
// Однако поскольку ориентации текста могут быть различными - правосторонняя и левосторонняя, то также необходимо
// указать направление текста textDirection: TextDirection.ltr. В зависимости от направления текста началом может быть
// левый край (слева направо) или правый край (справа налево)

// Column и CrossAxisAlignment в Flutter

// ==================================================================================================================
// VerticalDirection
// Параметр verticalDirection в конструкторе Column указывает на направление расположения элементов по вертикали:
// сверху вниз или снизу вверх. Этот параметр представляет класс VerticalDirection, который определяет следующие
// константы:
// ==================================================================================================================
// VerticalDirection.down: расположение сверху вниз
// ==================================================================================================================
// VerticalDirection.up: расположение снизу вверх
// ==================================================================================================================

// Например, расположение снизу вверх:

// void main() {
//   runApp(Container(
//     padding: EdgeInsets.all(30),
//     color: Colors.teal,
//     child:Column(
//         textDirection: TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         verticalDirection: VerticalDirection.up,
//         children: <Widget>[
//           Text('Вот мысль, которой весь я предан,',
//               textDirection: TextDirection.ltr),
//           Text('Итог всего, что ум скопил.',
//               textDirection: TextDirection.ltr),
//           Text('Лишь тот, кем бой за жизнь изведан,',
//               textDirection: TextDirection.ltr),
//           Text('Жизнь и свободу заслужил.',
//               textDirection: TextDirection.ltr)
//         ],
//       )
//     )
//   );
// }

// Column и VerticalDirection в Flutter
// ==================================================================================================================
// MainAxisAlignment
// Еще один параметр конструктора Column - mainAxisAlignment представляет класс MainAxisAlignment и управляет
// выравниванием по вертикали. Он может принимать следующие значения:
// ==================================================================================================================

// MainAxisAlignment.center: выравнивание по вертикали по центру
// ==================================================================================================================
// MainAxisAlignment.end: выравнивание в конце вертикальной оси. Где находится конец вертикальной оси, зависит от
// другого параметра конструктора - verticalDirection. Если он равен VerticalDirection.down (расположение виджетов
// сверху вниз), конец вертикальной оси аналогичен низу, а при значении VerticalDirection.up - находится вверху
// вертикальной оси.
// ==================================================================================================================
// MainAxisAlignment.start: выравнивание в начале вертикальной оси. Аналогично MainAxisAlignment.end расположение
// "начала" вертикальной оси зависит от значения параметра verticalDirection
// ==================================================================================================================
// MainAxisAlignment.spaceBetween: свободное пространство Column равным образом распределяется между вложенными
// виджетами
// ==================================================================================================================
// MainAxisAlignment.spaceEvenly: свободное пространство Column равным образом распределяется между вложенными
// виджетами, а также перед первым и после последнего виджета
// ==================================================================================================================
// MainAxisAlignment.spaceAround: свободное пространство Column равным образом распределяется между вложенными
// виджетами, кроме того, перед первым и после последнего виджета добавляются половинные отступы (половина от отступа
// между виджетами)
// ==================================================================================================================
// Например, расположим вложенные виджеты в центре по вертикали:

// void main() {
//   runApp(Container(
//     padding: EdgeInsets.only(top:30, left:10),
//     color: Colors.teal,
//     child:Column(
//         textDirection: TextDirection.ltr,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text('Вот мысль, которой весь я предан,',
//               textDirection: TextDirection.ltr),
//           Text('Итог всего, что ум скопил.',
//               textDirection: TextDirection.ltr),
//           Text('Лишь тот, кем бой за жизнь изведан,',
//               textDirection: TextDirection.ltr),
//           Text('Жизнь и свободу заслужил.',
//               textDirection: TextDirection.ltr)
//         ],
//       )
//     )
//   );
// }

// Выравнивание по вертикали MainAxisAlignment в Column в Flutter
// Пример использования значений spaceBetween, spaceEvenly и spaceAround:

// ==================================================================================================================
// Row() - делает и принимает все тоже самое, но основная и вторичная ось, меняется местами
// ==================================================================================================================

// void main(List<String> args) {
//   runApp(HomeWork());
// }

// ==================================================================================================================
//  Вёрстка в классе
// ==================================================================================================================
void main(List<String> args) {
  runApp(
    Container(
      padding: const EdgeInsets.only(top: 50),
      color: Colors.blueGrey,
      child: Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          // Как бы аппбар
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                // Бургер
                Container(
                  width: 30,
                  height: 30,
                  child: Column(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 3,
                        color: Colors.red,
                      ),
                      Container(
                        height: 3,
                        color: Colors.red,
                      ),
                      Container(
                        height: 3,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Заголовок',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ),

          // Первая строка
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            height: 150,
            padding: EdgeInsets.all(25),
            child: Container(
              color: Colors.yellow,
            ),
          ),

          // Второй блок

          Container(
            height: 400,
            // color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          textDirection: TextDirection.ltr,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
