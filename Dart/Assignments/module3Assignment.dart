class Car {
  late String brand;
  late String model;
  late int year;
  late double milesDriven;

  static int numberOfCars = 0;

  Car(this.brand, this.model, this.year) {
    milesDriven = 0.0;
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    int currentYear = 2023;
    return currentYear - year;
  }
}

void main() {
  Car car1 = Car('Jaguar', 'Sedan', 2018);
  car1.drive(5000.0);

  Car car2 = Car('Lamborghini', 'Spyder', 2019);
  car2.drive(7000.0);

  Car car3 = Car('BMW', 'Bentley', 2020);
  car3.drive(3000.0);

  print('Car 1: ${car1.getBrand()} ${car1.getModel()} ${car1.getYear()}');
  print('Miles driven: ${car1.getMilesDriven()}');
  print('Age: ${car1.getAge()} years');

  print('Car 2: ${car2.getBrand()} ${car2.getModel()} ${car2.getYear()}');
  print('Miles driven: ${car2.getMilesDriven()}');
  print('Age: ${car2.getAge()} years');

  print('Car 3: ${car3.getBrand()} ${car3.getModel()} ${car3.getYear()}');
  print('Miles driven: ${car3.getMilesDriven()}');
  print('Age: ${car3.getAge()} years');

  print('Total number of cars created: ${Car.numberOfCars}');
}
