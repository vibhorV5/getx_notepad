import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditorService extends GetxService {
  late TextEditingController textEditingController;

  RxString homeScreenText = ''.obs;
  RxString textAdded = ''.obs;

  void saveTextForHomeScreen(String text) {
    homeScreenText.value = '${homeScreenText.value} \n${textAdded.value}';
  }

  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    textAdded('');
  }
}
