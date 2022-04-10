import 'package:dynamic_average_calculation/constants/app_constant.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int numberOfCourses;
  const ShowAverage(
      {required this.average, required this.numberOfCourses, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          numberOfCourses > 0
              ? "$numberOfCourses Courses Entered"
              : "Enter Courses",
          style: Constants.numberOfCoursesStyle,
        ),
        Text(
          average > 0 ? "${average.toStringAsFixed(2)}" : "0.0",
          style: Constants.averageStyle,
        ),
        Text(
          "Average",
          style: Constants.numberOfCoursesStyle,
        ),
      ],
    );
  }
}
