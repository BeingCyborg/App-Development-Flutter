class Person {
  String name;
  int age;
  String address;

  Person(this.name, this.age, this.address);

  void sayHello() {
    print('Hello, my name is $name.');
  }

  int getAgeInMonths() {
    return age * 12;
  }
}

void main() {
  Person person = Person('Sayed Hossain Jobayer', 23, 'Khilkhet, Dhaka-1229');
  person.sayHello();

  int ageInMonths = person.getAgeInMonths();
  print('Age : $ageInMonths months');
}
