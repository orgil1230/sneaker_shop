import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sneakers_shop/src/model/sneaker_model.dart';
import 'package:sneakers_shop/src/pages/0_sneaker/main_controller.dart';
import 'package:sneakers_shop/src/pages/create_product/create_screen.dart';
import 'package:sneakers_shop/src/pages/detail/detail.dart';

import 'package:sneakers_shop/src/pages/edit_product/edit_product.dart';

import 'dump_json.dart';

class ListController extends MainController {
  final box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    await box.write('sneakers', sneakers);

    fireStore.collection('sneakers').get().then(
      (value) {
        sneakers.value = value.docs.map((e) {
          return Sneaker.fromSnapshot(e);
        }).toList();
        sneakers.refresh();
      },
    );
    // sneakers.value = jsonSneakers
    //     .map((sneakerJson) => Sneaker.fromJson(sneakerJson))
    //     .toList();

    isLoading.value = false;
  }

  onTapDetail(int index) {
    Get.to(() => DetailScreen(sneaker: sneakers[index]))!
        .then((value) => Get.back());
  }

  onTapCreate() {
    Get.toNamed(CreateScreen.routeName)!.then((value) => sneakers.refresh());
  }

  onTapEdit(int index) {
    Get.to(() => EditScreen(sneaker: sneakers[index]))!
        .then((value) => Get.back());
  }

  onTapFavourite(int index) {
    sneakers[index].isFav = !sneakers[index].isFav;
    sneakers.refresh();

    fireStore
        .collection("sneakers")
        .doc(sneakers[index].id)
        .set(sneakers[index].toJson(), SetOptions(merge: true))
        .onError((e, _) => print("Error writing document: $e"));
  }

  onTapDelete(int index) {
    // print(box.read('quote'));
    // print(box.read('userName'));
    // print(box.read('sneakers'));
    // RxList tempSneakers = box.read('sneakers');
    // print('${tempSneakers[0].name}');

    print('sneakers[index].id---${sneakers[index].id}');

    fireStore.collection("sneakers").doc(sneakers[index].id).delete().then(
      (doc) {
        sneakers.removeAt(index);
        sneakers.refresh();
        print("Document deleted");
      },
      onError: (e) => print("Error updating document $e"),
    );
// out: GetX is the best
  }
}
