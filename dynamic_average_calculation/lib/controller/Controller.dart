import 'package:get/get.dart';

class harfControl extends GetxController {
  var harfNotu = 4.0.obs;

  void setVal(double val) {
    harfNotu.value = val;
  }
}

class creditControl extends GetxController {
  var credit = 1.0.obs;

  void setVal(double val) {
    credit.value = val;
  }
}

class averageControl extends GetxController {
  var average = 0.0.obs;

  void setVal(double val) {
    average.value = val;
  }
}

class courseNumbers extends GetxController {
  var courseN = 0.obs;

  void setVal(int val) {
    courseN.value = val;
  }

  void increase() {
    courseN.value = courseN.value + 1;
  }
}

class courseNameControl extends GetxController {
  var name = "".obs;

  void setVal(String val) {
    name.value = val;
  }
}
