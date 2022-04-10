import 'package:dynamic_average_calculation/constants/app_constant.dart';
import 'package:dynamic_average_calculation/view/calculating_average_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Dynamic Average Calculation",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Constants.mainColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: CalculatingAveragePage(),
    );
  }
}
