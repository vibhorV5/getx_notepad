import 'package:get/get.dart';
import 'package:getx_notepad/Screens/Editor/View/editor_screen.dart';
import 'package:getx_notepad/Screens/Home/View/home_screen.dart';

const String home = '/homeScreen';
const String editor = '/editorScreen';

class Routes {
  static final routes = [
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: editor, page: () => const EditorScreen()),
  ];
}
