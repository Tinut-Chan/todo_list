import 'package:flutter/material.dart';
import 'package:flutter_todo/screen/home_screen.dart';
import 'package:flutter_todo/screen/todo_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unFocus(context),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.id,
        getPages: [
          GetPage(name: TodoScreen.id, page: () => TodoScreen()),
          GetPage(name: HomeScreen.id, page: () => HomeScreen()),
        ],
      ),
    );
  }

  void unFocus(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
