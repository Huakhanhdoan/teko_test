import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teko_shop/data/models/item_model.dart';
import 'package:teko_shop/domain/use_cases/add_item_uc.dart';
import 'package:teko_shop/domain/use_cases/get_item_uc.dart';
import 'package:teko_shop/presentation/validator/validator.dart';

class HomeController extends GetxController {
  final GetItemUseCase _getItemUseCase;
  final AddItemUseCase _addItemUseCase;

  HomeController(this._getItemUseCase, this._addItemUseCase);

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxString _images = "".obs;

  String get images => _images.value;
  final RxList<ItemModel> _listItem = <ItemModel>[].obs;

  List<ItemModel> get listItem => _listItem;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  onAddProduct() async {
    if (formKey.currentState!.validate()) {
      final item = ItemModel(
        name: nameController.text,
        price: int.parse(priceController.text),
        imageSrc: images,
      );
      await _addItemUseCase.execute(item);
      Get.snackbar(
        'Thông báo', // title
        'Thêm sản phẩm thành công', // message
        backgroundColor: Colors.green,
        icon: const Icon(Icons.notifications),
        shouldIconPulse: false,
        barBlur: 20,
        isDismissible: true,
        duration: const Duration(seconds: 3),
      );
    }
  }

  onDeleteImage() {
    _images.value = "";
  }

  String? validatorName() {
    return Validator.validateNameItem(nameController.text);
  }

  String? validatorPrice() {
    return Validator.validatePrice(priceController.text);
  }

  Future<void> pickImage() async {
    String? base64Image = await pickImageAndConvertToBase64();
    _images.value = base64Image;
  }

  Future<String> pickImageAndConvertToBase64() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await File(pickedFile.path).readAsBytes();
      return base64Encode(bytes);
    } else {
      throw Exception('No image selected.');
    }
  }

  _fetchData() async {
    try {
      final response = await _getItemUseCase.execute();
      _listItem.value = response ?? [];
    } catch (e) {
      print(e);
    }
  }
}
