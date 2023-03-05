import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/create_product/create_screen.dart';

import 'package:sneakers_shop/src/pages/edit_product/edit_controller.dart';
import 'package:sneakers_shop/src/pages/edit_product/edit_product.dart';

import 'dump_json.dart';

class ListController extends GetxController {
  RxList sneakers = [].obs;
  RxBool isLoading = false.obs;

  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    await box.write('sneakers', sneakers);

    await Future.delayed(const Duration(seconds: 1));
    sneakers.value = jsonSneakers
        .map((sneakerJson) => Sneaker.fromJson(sneakerJson))
        .toList();

    isLoading.value = false;
  }

  onTapCreate() {
    Get.toNamed(CreateScreen.routeName);
  }

  onTapEdit(int index) {
    Get.to(() => EditScreen(sneaker: sneakers[index]))!
        .then((value) => Get.back());
  }

  onTapFavourite(int index) {
    sneakers[index].isFav = !sneakers[index].isFav;
    sneakers.refresh();
  }

  onTapDelete(int index) {
    print(box.read('quote'));
    print(box.read('userName'));
    print(box.read('sneakers'));
    RxList tempSneakers = box.read('sneakers');
    print('${tempSneakers[0].name}');
// out: GetX is the best

    // sneakers.removeAt(index);
    // sneakers.refresh();
  }
}
