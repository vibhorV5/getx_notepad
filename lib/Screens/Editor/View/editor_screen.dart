import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notepad/Routes/routes.dart';
import 'package:getx_notepad/Services/Editor/editor_service.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 40,
        width: 200,
        child: FloatingActionButton(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.greenAccent,
          child: Container(
            alignment: Alignment.center,
            width: 90,
            child: const Text(
              'Add Text',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPressed: () async {
            Get.find<EditorService>().textAdded.value =
                Get.find<EditorService>().textEditingController.text;
            Get.find<EditorService>().saveTextForHomeScreen(
                Get.find<EditorService>().textEditingController.text);

            FocusScope.of(context).unfocus();
            await Future.delayed(
              const Duration(milliseconds: 200),
              () {
                debugPrint('Delayed execution done');
              },
            );
            Get.snackbar(
              'Note Added',
              'Navigating to the Home Screen',
              icon: const Icon(
                Icons.check,
                color: Colors.green,
              ),
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(
                milliseconds: 1500,
              ),
            );
            await Future.delayed(
              const Duration(seconds: 1),
              () {
                debugPrint('Delayed execution done');
              },
            );
            Get.find<EditorService>().textEditingController.clear();

            Get.offAllNamed(home);
            // Get.toNamed(home);
            // Get.back();
          },
        ),
      ),
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.find<EditorService>().textEditingController.clear();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text('Editor Screen'),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: mediaQuery.height,
          width: mediaQuery.width,
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: Get.find<EditorService>().textEditingController,
                onSubmitted: (value) {
                  Get.find<EditorService>().textAdded.value = value;
                },
                autofocus: true,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
