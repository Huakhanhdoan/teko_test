import 'package:get/get.dart';
import 'package:teko_shop/domain/use_cases/add_item_uc.dart';
import 'package:teko_shop/domain/use_cases/get_item_uc.dart';
import 'package:teko_shop/presentation/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find(), Get.find()),
    );
    Get.lazyPut<AddItemUseCase>(
      () => AddItemUseCase(Get.find()),
    );
    Get.lazyPut<GetItemUseCase>(
      () => GetItemUseCase(Get.find()),
    );
  }
}
