/*
Задание 1

Создать объект человека, с параметрами: Name, Second name, Age City, Secondary Education(boolean), Hobby. 
Реализовать проверку возраста, если он < 0 вывести в консоль сообщение об ошибке. Если возраст  < 8 то он еще ребенок. Если ему меньше 18 то у него нет среднего образования 
Создать несколько объектов и реализовать метод printInfo()

*/

void main(List<String> args) {
  People vazgen = People(
    age: 7,
    city: "Ташкент",
    name: "Вазген",
    secondName: "Арутюнян",
  );

  vazgen.printInfo();

  print(vazgen);
}

class People {
  String name;
  String secondName;
  int age;
  String city;
  String hobby;
  late bool _secEducation;

  People({
    required this.name,
    required this.age,
    required this.city,
    required this.secondName,
    this.hobby = 'Отсутствуют',
  }) {
    if (this.age < 0) print('Введите коррекный возраст');

    if (this.age < 18) {
      this._secEducation = false;
    } else {
      this._secEducation = true;
    }
  }

  void printInfo() {
    print('=================================================');
    print('''
Пользователь: ${this.name} ${this.secondName}
Возрост: ${this.age}
Текущей город: ${this.city}
Увлечение: ${this.hobby}
Среднее образование: ${this._secEducation ? "Есть" : "Нет"}''');
    print('=================================================');
  }

  // @override
  // String toString() {
  //   return 'Данный класс имеет имя ${this.name}';
  // }
}
