import 'package:flutter/material.dart';

import '../model/course.dart';

class DataHepler {
  static List<Course> allCourses = [];

  static addCourse(Course c) {
    allCourses.add(c);
  }

  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1);
  }

  static double calculateAverage() {
    double totalNot = 0;
    double totalCredit = 0;

    allCourses.forEach((element) {
      totalNot = totalNot + (element.credit * element.harf);
      totalCredit = totalCredit + element.credit;
    });

    return totalNot / totalCredit;
  }

  static List<DropdownMenuItem<double>> allCreditstoList() {
    return _allCredits()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e.toDouble(),
            ))
        .toList();
  }
}
