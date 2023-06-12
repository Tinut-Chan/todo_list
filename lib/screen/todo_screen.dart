import 'package:flutter/material.dart';
import 'package:flutter_todo/controllers/todo_controller.dart';
import 'package:flutter_todo/models/todo_model.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  static const id = '/Todo_Screen';

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo Item'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: todoController.textEditingController.value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(context.width / 1.15, 50.0),
                  ),
                  child: const Text('Add'),
                  onPressed: () {
                    todoController.todos.add(
                      Todo(
                        text: todoController.textEditingController.value.text,
                      ),
                    );
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
