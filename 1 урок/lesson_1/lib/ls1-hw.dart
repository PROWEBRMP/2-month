/*
Задание 1

Создать объект человека, с параметрами:
•	Name
•	Second name
•	Age 
•	City
•	Secondary Education 
•	Hobby
*/

void main(List<String> args) {
  Puple vazgen = Puple(
    age: 19,
    city: "Ташкент",
    name: "Вазген",
    secondName: "Арутюнян",
  );

  vazgen.printInfo();
}

class Puple {
  String name;
  String secondName;
  int age;
  String city;
  bool secEducation;
  String hobby;

  Puple({
    required this.name,
    this.secEducation = false,
    required this.age,
    required this.city,
    required this.secondName,
    this.hobby = 'Отсутствуют',
  }) {
    if (this.age < 0) print('Введите коррекный отступ');
  }

  void printInfo() {
    print(
        '=========================================================================');
    print(
        'Пользователь: ${this.name} ${this.secondName}\nВозрост: ${this.age}\nТекущей город: ${this.city}\nУвлечение: ${this.hobby}\nСреднее образование: ${this.secEducation ? "Нет" : "Есть"}');
    print(
        '=========================================================================');
  }
}
