import 'package:dynamic_average_calculation/constants/app_constant.dart';
import 'package:dynamic_average_calculation/helper/datahelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Controller.dart';
import '../model/course.dart';
import '../widgets/courseList.dart';
import '../widgets/show_average.dart';

class CalculatingAveragePage extends StatelessWidget {
  final _harfController = Get.put(harfControl());
  final _creditControl = Get.put(creditControl());
  final _courseNameControl = Get.put(courseNameControl());
  final _averageControl = Get.put(averageControl());
  final _courseNumbers = Get.put(courseNumbers());

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Constants.mainTittle,
              style: Constants.tittleStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: _buildForm()),
                Expanded(
                    flex: 1,
                    child: Obx(
                      () => ShowAverage(
                          average: _averageControl.average.value,
                          numberOfCourses: _courseNumbers.courseN.value),
                    )),
              ],
            ),
            Expanded(child: CourseList())
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: _buildTextFromField(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: _buildNots(),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: _buildCredits(),
            ),
            IconButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var addCourse = Course(
                      name: _courseNameControl.name.value,
                      harf: _harfController.harfNotu.value,
                      credit: _creditControl.credit.value);
                  DataHepler.addCourse(addCourse);
                  _courseNumbers.setVal(DataHepler.allCourses.length);
                  _averageControl.setVal(DataHepler.calculateAverage());
                  print(addCourse.toString());
                }
              },
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Constants.mainColor,
              iconSize: 30,
            )
          ],
        )
      ]),
    );
  }

  _buildTextFromField() {
    return TextFormField(
      onSaved: (value) {
        _courseNameControl.name.value = value!;
      },
      validator: (val) {
        if (val!.length <= 0)
          return "Please enter the course's name";
        else
          return null;
      },
      style: Constants.dropDownTextStyle,
      decoration: InputDecoration(
          hintText: "Enter the course name",
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadious,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.mainColor.shade100.withOpacity(0.3)),
    );
  }

  _buildNots() {
    return Container(
        padding: Constants.dropdownPadding,
        decoration: BoxDecoration(
            color: Constants.mainColor.shade100.withOpacity(0.3),
            borderRadius: Constants.borderRadious),
        child: Obx(
          () => DropdownButton<double>(
              style: Constants.dropDownTextStyle,
              underline: Container(),
              value: _harfController.harfNotu.value,
              onChanged: (not) {
                _harfController.setVal(not!);
                //debugPrint(_harfController.harfNotu.value.toString());
              },
              items: [
                DropdownMenuItem(child: Text("AA"), value: 4),
                DropdownMenuItem(child: Text("BA"), value: 3.5),
                DropdownMenuItem(child: Text("BB"), value: 3),
                DropdownMenuItem(child: Text("CB"), value: 2.5),
                DropdownMenuItem(child: Text("CC"), value: 2),
                DropdownMenuItem(child: Text("DC"), value: 1.5),
                DropdownMenuItem(child: Text("DD"), value: 1),
                DropdownMenuItem(child: Text("FF"), value: 0),
              ]),
        ));
  }

  _buildCredits() {
    return Container(
        padding: Constants.dropdownPadding,
        decoration: BoxDecoration(
            color: Constants.mainColor.shade100.withOpacity(0.3),
            borderRadius: Constants.borderRadious),
        child: Obx(
          () => DropdownButton<double>(
              style: Constants.dropDownTextStyle,
              underline: Container(),
              value: _creditControl.credit.value,
              onChanged: (cre) {
                _creditControl.setVal(cre!);
                //debugPrint(_harfController.harfNotu.value.toString());
              },
              items: DataHepler.allCreditstoList()),
        ));
  }
}
