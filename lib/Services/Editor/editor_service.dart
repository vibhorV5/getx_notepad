import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditorService extends GetxService {
  final box = GetStorage();

  late TextEditingController textEditingController;

  RxString homeScreenText = ''.obs;
  RxString textAdded = ''.obs;

  void saveTextForHomeScreen(String text) async {
    homeScreenText.value = '${homeScreenText.value} \n${textAdded.value}';
    await box.write('savedtexts', homeScreenText.value);
  }

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    homeScreenText.value = box.read('savedtexts') ?? '';
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    textAdded('');
  }
}
