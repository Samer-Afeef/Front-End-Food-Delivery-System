import 'package:get/get.dart';



 validInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "الايميل غير فعال";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return  "رقم الهاتف غير فعال";
    }
  }
  if (type == "date") {
    if (!GetUtils.isDateTime(val)) {
      return "the value is not date";
    }
  }

  if (val.isEmpty) {
    return "لايمكن ان يكون هذا الحقل فارغ";
  }

  if (val.length < min) {
    return "${"لايمكن ان يكون هذا الحقل اصغر من"}  $min";
  }

  if (val.length > max) {
    return "${"لايمكن ان يكون هذا الحقل اكبر من"}  $max";
  }
}
