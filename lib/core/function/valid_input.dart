import 'package:get/get.dart';

validInput(int min, int max, String type, String val) {

  if (val.isEmpty) {
    return "Can't be empty";
  }

  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return "Unvalid phone number";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Unvalid email";
    }
  }
  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "Unvalid name";
    }
  }
  if (val.length > max) {
    return "Can't be tall than $max ";
  }
    if (val.length < min) {
    return "Can't be short than $min ";
  }
}
