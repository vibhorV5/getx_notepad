import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_notepad/Routes/routes.dart';
import 'package:getx_notepad/Services/Editor/editor_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final box = GetStorage();

  // int counter = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   setState(() {
  //     counter = box.read('counter') ?? 0;
  //   });
  // }

  // increase() {
  //   setState(() {
  //     counter++;
  //     box.write('counter', counter);
  //   });
  // }

  final editorService = Get.put(EditorService());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Get.toNamed(editor);
        },
      ),
      appBar: AppBar(
        title: const Center(
          child: Text('Home Screen'),
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
              // Container(
              //   height: 100,
              //   width: 400,
              //   color: Colors.blue,
              //   child: Text('${box.read('counter')}'),
              // ),
              // TextButton(onPressed: increase, child: Text('Button')),
              Get.find<EditorService>().homeScreenText.isEmpty
                  ? Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'No Notes found',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Notes you have added',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              Obx(
                () {
                  return Text(
                    '${editorService.homeScreenText}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
