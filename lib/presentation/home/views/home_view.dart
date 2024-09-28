import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teko_shop/core/constant/app_constant.dart';
import 'package:teko_shop/presentation/home/controllers/home_controller.dart';
import 'package:teko_shop/presentation/widgets/base_input.dart';
import 'package:teko_shop/presentation/widgets/common_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCardAddItem(),
                SizedBox(
                  width: Get.mediaQuery.size.width,
                  height: Get.mediaQuery.size.height / 2,
                  child: _buildListProduct(),
                )
                //  _buildListProduct(),
              ],
            ),
          );
        }),
      ),
    );
  }

  _buildCardAddItem() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Quản lý sản phẩm",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildTileInput(
              "Tên sản phẩm",
            ),
            BaseInput(
              controller: controller.nameController,
              maxLength: AppConstant.maxLengthName,
              validator: (_) => controller.validatorName(),
            ),
            _buildTileInput(
              "Giá sản phẩm ",
            ),
            BaseInput(
              controller: controller.priceController,
              keyboardType: TextInputType.number,
              validator: (_) => controller.validatorPrice(),
            ),
            _buildUploadImage(),
            ElevatedButton(
              onPressed: controller.onAddProduct,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Text(
                  'Tạo sản phẩm',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTileInput(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "*",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildUploadImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ảnh sản phẩm",
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () async {
                await controller.pickImage();
              },
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.grey.shade100),
                foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.cloud_upload_outlined,
                      color: Colors.black, size: 20),
                  SizedBox(width: 10),
                  Text('Chọn tệp tin (Tối đa 5MB)'),
                ],
              ),
            ),
            (controller.images.isNotEmpty)
                ? Stack(
                    children: [
                      Image.memory(
                        base64Decode(controller.images),
                        width: 200,
                        height: 200,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          onPressed: controller.onDeleteImage,
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  _buildListProduct() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemCount: controller.listItem.length,
      itemBuilder: (context, index) {
        return CommonItem(
          name: controller.listItem[index].name,
          price: controller.listItem[index].price.toString(),
          image: controller.listItem[index].imageSrc ?? "",
        );
      },
    );
  }
}
