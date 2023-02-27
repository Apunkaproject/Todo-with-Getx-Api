import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todo/api/todo_controller.dart';

import '../config/constant.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    TextEditingController text = TextEditingController();
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: whitecolor,
      ),
      height: 250,
      child: Column(
        children: [
          Text("New Task"),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: text,
                  decoration: InputDecoration(
                    hintText: "Enter task",
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              todoController.postTodos(text.text);
              print(text.text);
              Get.back();
              text.clear();
            },
            child: const Text("SAVE"),
          )
        ],
      ),
    );
  }
}
