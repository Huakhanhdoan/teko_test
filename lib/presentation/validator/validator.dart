import 'package:teko_shop/core/constant/app_constant.dart';

class Validator {
  static String? validateNameItem(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tên không được để trống';
    }
    return null;
  }

  static String? validatePrice(String? value) {
    final number = num.tryParse(value ?? '');
    if (number == null) {
      return 'Giá không được để trống';
    }
    if (number <= AppConstant.minPrice) {
      return 'Giá phải lớn hơn 10000';
    }
    if (number > AppConstant.maxPrice) {
      return 'Giá phải nhỏ hơn 100000000';
    }
    return null;
  }
}
