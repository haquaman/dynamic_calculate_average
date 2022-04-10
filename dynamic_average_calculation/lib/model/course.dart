class Course {
  final String name;
  final double harf;
  final double credit;

  Course({required this.name, required this.harf, required this.credit});

  @override
  String toString() {
    return "$name $harf $credit";
  }
}
