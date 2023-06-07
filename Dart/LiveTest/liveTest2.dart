List<int> getOddNumbers(List<int> numbers) {
  List<int> oddNumbers = [];
  for (int number in numbers) {
    if (number % 2 != 0) {
      oddNumbers.add(number);
    }
  }
  return oddNumbers;
}

void main() {
  List<int> list = [2, 5, 8, 11, 13, 18, 21, 24];
  List<int> oddNumbers = getOddNumbers(list);
  print("Input list : $list");
  print("Output list : $oddNumbers");
}
