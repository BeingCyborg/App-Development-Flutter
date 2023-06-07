void main() {
  List<String> phoneNumber = [
    "+88",
    "01768131685",
    "01768171985",
    "01768111286",
    "01768131685"
  ];
  var l = phoneNumber.length;
  // print(l);
  for (int i = 1; i < l; i++) {
    print(phoneNumber[0] + phoneNumber[i]);
  }
}
