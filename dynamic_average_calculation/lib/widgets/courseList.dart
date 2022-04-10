import 'package:dynamic_average_calculation/constants/app_constant.dart';
import 'package:dynamic_average_calculation/helper/datahelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Controller.dart';

class CourseList extends StatelessWidget {
  final courseNumbers _courseNumbers = Get.find();
  final averageControl _averageControl = Get.find();
  CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => _courseNumbers.courseN.value > 0
        ? ListView.builder(
            itemCount: _courseNumbers.courseN.value,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  DataHepler.allCourses.removeAt(index);
                  _courseNumbers.courseN.value = DataHepler.allCourses.length;
                  _averageControl.setVal(DataHepler.calculateAverage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Constants.mainColor, width: 2),
                      borderRadius: Constants.borderRadious,
                    ),
                    child: ListTile(
                      title: Text(DataHepler.allCourses[index].name),
                      leading: CircleAvatar(
                        backgroundColor: Constants.mainColor,
                        child: Text((DataHepler.allCourses[index].harf *
                                DataHepler.allCourses[index].credit)
                            .toStringAsFixed(0)),
                      ),
                      subtitle: Text(
                          "Credit: ${DataHepler.allCourses[index].credit} , Note: ${DataHepler.allCourses[index].harf} "),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
                child: Text(
              "Please add Course",
              style: Constants.tittleStyle,
            )),
          ));
  }
}
