// // Еще одно решение проблемы множественного наследования в Dart представляют миксины.
// // По сути миксин представляет обычный класс за тем исключением, что он не должен 
//содержать конструктор,
// // иначе он не может быть использован в качестве миксина.
// Для применения миксинов применяется оператор with:

// void main() {
//   // ignore: omit_local_variable_types
//   Employee bob = Employee('Bob', 'Google');
//   bob.display(); // Name: Bob
//   bob.work(); // Works in Google

//   // ignore: omit_local_variable_types
//   Worker tom = Worker();
//   // ignore: prefer_single_quotes
//   tom.company = "Apple";
//   tom.work();
// }

// class Person {
//   String name;
//   Person(this.name);
//   void display() {
//     print('Name: $name');
//   }
// }

// // В то же время мы можем указать, что данный тип будет использоваться только как миксин 
//(если мы не планируем использовать его в качестве отдельного класса).
// // В этом случае для опрделения типа применяется ключевое слово mixin:

// // mixin Worker {
// class Worker {
//   String company = '';
//   void work() {
//     print('Work in $company');
//   }
// }

// // В данном случае класс Worker выступает в роли миксина.
// // Для использования его функционала при определении класса
// //Employee применяется оператор with:
// // После этого класс Employee может использовать поля и методы из класса Worker.
// // При этом класс Employee может наследовать от других классов, как в
// //данном случае от класса Person.
// // При этом поскольку тип Worker определен как обычный класс, мы можем
// // использовать его независимо:
// class Employee extends Person with Worker {
//   Employee(name, comp) : super(name) {
//     company = comp; // обращаемся к полю company, определенному в миксине Worker
//   }
// }

// Кроме обычных методов и полей класс может иметь статические поля, методы, константы.
// Значения таких полей, методов и констант относятся в целом ко всему классу, а не к отдельным объектам.
// Для определения статических переменных, констант и методов перед их объявлением указывается ключевое слово static.

// Статические поля
// Статические поля хранят состояние всего класса. Статическое поле определяется как и обычное,
// только впереди ставится ключевое слово static. Например, рассмотрим класс Employee, который представляет работника:

void main() {
  Employee bob = Employee("Bob", 55);
  bob.checkAge();
  Employee.retirenmentAge = 65;
  bob.checkAge();
}

class Employee {
  String name;
  int age;
  static int retirenmentAge = 60;

  Employee(this.name, this.age);

  checkAge() {
    if (age >= retirenmentAge) {
      print("Пора на пенсию");
    } else {
      print("До пенсии еще ${retirenmentAge - age} лет");
    }
  }
}
// В классе работника определены поля для хранения имени и возраста - у каждого отдельного работника может быть свое имя и свой возраст.
//Кроме того, определено статическое поле для хранения пенсионного возраста retirenmentAge. Оно относится не к конкретному работнику,
// а ко всем работникам, то есть ко всему классу Employee в целом, так как нельзя для каждого отдельного работника установить свой пенсионный групп.
//Затем в самом классе мы можем использовать это поле как и любые другие.

// Если мы хотим обратиться к этому полю вне класса, например, изменить его значение, то для обращения применяется имя класса:

// Employee.retirenmentAge = 65;

// Статические константы
// Если пенсионный возраст менять не планируется, то мы можем определить как статическую константу:

// void main (){

//     Employee bob = Employee("Bob", 55);
//     bob.checkAge();
//     print("Retirenment age: ${Employee.retirenmentAge}");
// }
// class Employee{

//     String name;
//     int age;
//     static const int retirenmentAge = 65;

//     Employee(this.name, this.age);

//     checkAge(){
//         if(age >= retirenmentAge){
//             print("Пора на пенсию");
//         }
//         else{
//             print("До пенсии еще ${retirenmentAge - age} лет");
//         }
//     }
// }

// Для определения статической константы можно использовать либо выражение static const, либо static final:

// static const int retirenmentAge = 65;
// static final int retirenmentAge = 65;
// Статические методы
// Статические методы также относятся ко всему классу и предваряются ключевым словом static.
// Как правило, статические методы выполняют такие вычисления, которые не затрагивают состояние или поведение объекта:

// void main (){

//     int a = Operation.sum(3, 5);
//     int b = Operation.subtract(15, 7);
//     int c = Operation.multiply(3, 5);
//     print("a=$a  b=$b  c=$c");  // a=8  b=8  c=15
// }
// class Operation{

//     static int sum(int x, int y) => x + y;
//     static int subtract(int x, int y) => x - y;
//     static int multiply(int x, int y) => x * y;
// }
// В данном случае для методов sum, subtract, multiply не имеет значения, какой именно экземпляр класса Operation используется.
// Эти методы работают только с параметрами, не затрагивая состояние класса. Поэтому их можно определить как статические.

// Стоит отметить, что Google не рекомендует создавать классы, которые содержать только статические методы и переменные/константы,
// как выше определенный класс Operation. Так как в этом случае мы просто можем определить обычные функции и также их использовать:

// void main (){

//     int a = sum(3, 5);
//     int b = subtract(15, 7);
//     int c = multiply(3, 5);
//     print("a=$a  b=$b  c=$c");  // a=8  b=8  c=15
// }
// int sum(int x, int y) => x + y;
// int subtract(int x, int y) => x - y;
// int multiply(int x, int y) => x * y;
// Статические методы могут использоваться для управления статическими полями, то есть состоянием, которое относится ко всему классу.
// В то же время в статических методах мы не можем использовать нестатические методы и поля класса:

// void main (){

//     Employee bob = Employee("Bob", 55);
//     Employee.setRetirenmentAge(63);
//     print(Employee.retirenmentAge);
// }
// class Employee{

//     String name;
//     int age;
//     static int retirenmentAge = 65;

//     Employee(this.name, this.age);

//     checkAge(){
//         if(age >= retirenmentAge){
//             print("Пора на пенсию");
//         }
//         else{
//             print("До пенсии еще ${retirenmentAge - age} лет");
//         }
//     }
//     static void setRetirenmentAge(int value){
//         if(value > 50 && value < 70){
//             retirenmentAge = value;
//         }
//         else{
//             print("Некорректное значение");
//         }
//     }
// }
// В данном случае статический метод setRetirenmentAge позволяет управлять статической переменной retirenmentAge.

// В чем преимущества статических полей и методов перед нестатическими? Статические поля и методы потребляют меньше памяти,
// чем нестатические. Нестатическая переменная после инициализации (при первом присвоении значения) сразу начинает потреблять
// память независимо от того, используется она или нет. А статические поля и методы не инициализируются до того момента, пока
// они не начнут использоваться в программе. Соответственно потреблять память они начинают только тогда, когда непосредственно начинают использоваться.

// Generics или обобщения позволяют добавить программе гибкости и уйти от жесткой привязки к определенным типам.
//  Иногда возникает необходимость, определить функционал таким образом, чтобы он мог использовать данные любых типов.

// Например, мы определяем класс пользователя, который содержит id (идентификатор пользователя):

// class Person{
//     int id; // идентификатор пользователя
//     String name; // имя пользователя
//     Person(this.id, this.name);
// }
// В данном случае id задан как числовое значение, то есть оно может быт равно 2, 5, 7 и так далее.
//  Но возможно, нам захочется впоследствии использовать в качестве типа id строки или какие-то другие классы.
//   Для добавления гибкости мы могли бы использовать оператор dynamic, чтобы избежать жесткой привязки к типу:

// class Person{
//     dynamic id; // идентификатор пользователя
//     String name; // имя пользователя
//     Person(this.id, this.name);
// }
// void main (){

//     Person tom = Person(134, "Tom");
//     print(tom.id);
//     Person bob = Person("324", "Bob");
//     print(bob.id);
// }
// Однако мы можем не знать, какой именно объект представляет поле id, особенно если класс
// Person определен во внешней библиотеке, которая написана сторонними разработчиками.
// И при попытке получить число в данном случае мы столкнемся с исключением:

// 1
// 2
// Person bob = Person("324", "Bob");
// int id = bob.id;    // Ошибка
// Можно предусмотреть два типа Person для работы с разными типами:

// class PersonInt{
//     int id;
//     String name;
//     PersonInt(this.id, this.name);
// }
// class PersonString{
//     string id;
//     String name;
//     PersonString(this.id, this.name);
// }
// Но в данном случае мы сталкиваемся с другой проблемой - дублированием кода.

// Generics или обобщения позволяют обеспечить большую безопасность типов и помогают
// избежать дублирования кода. Перепишем код класса Person с использованием generics:

// void main (){

//     Person bob = Person("324", "Bob");
//     print(bob.id.runtimeType);  // String
//     Person sam = Person(123, "Sam");
//     print(sam.id.runtimeType);  // int
// }

// class Person<T>{
//     T id;   // идентификатор пользователя
//     String name; // имя пользователя
//     Person(this.id, this.name);
// }
// С помощью выражения <T> мы указываем, что класс Person типизирован определенным типом T.
// T еще называется универсальным параметром. Причем название параметра может быть произвольным,
// но обычно используются заглавные буквы, часто буква T. После мы можем использовать T как обычный тип, например, определять переменные этого типа: T id;.

// При выполнении программы вместо Т будет подставляться конкретный тип. Причем тип будет вычислять динамически на основе переданных значений.
// С помощью поля runtimeType мы можем получить конкретный тип данных переменной. Мы также могли бы явным образом обозначить, какие типы будут использоваться в объектах:

// Person<String> bob = Person<String>("324", "Bob");
// print(bob.id.runtimeType);
// Person<int> sam = Person<int>(123, "Sam");
// print(sam.id.runtimeType);
// Тип, которым типизируется класс, указывается в угловых скобках после названия класса (Person<String>).

// Подобным образом мы можем определять generic-методы и функции. Например, определим и используем небольшую функцию логгирования:

// void main (){

//     int x = 20;
//     log(x);
//     x = 34;
//     log(x);
//     String name = "Tom";
//     log(name);
// }
// void log<T>(T a){

//     // DateTime.now() - получает текущую дату и время
//     print("${DateTime.now()} a=$a");
// }
// Для создания обобщенного метода после его имени указывается в угловых скобках название универсального параметра.
// После этого внутри этого универсальный тип T может использоваться внутри метода - в качестве типа параметров или переменных
