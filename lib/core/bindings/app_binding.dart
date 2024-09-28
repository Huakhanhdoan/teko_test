import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teko_shop/data/data_source/remote/item_service.dart';
import 'package:teko_shop/data/repositories/item_repository_impl.dart';
import 'package:teko_shop/domain/repositories/item_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemService>(() => ItemService(Dio()));
    Get.lazyPut<ItemRepository>(() => ItemRepositoryImpl(Get.find()));
  }
}
