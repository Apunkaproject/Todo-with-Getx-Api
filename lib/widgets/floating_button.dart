import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todo/api/todo_controller.dart';

import '../api/Todos_controller.dart';
import '../config/constant.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();
    TodoController todoController = Get.put(TodoController());
    return InkWell(
      onTap: () {
        Get.bottomSheet(Container(
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
                  todoController.postTodo(text.text);
                  Get.back();
                  text.clear();
                },
                child: const Text("SAVE"),
              )
            ],
          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Icon(
          Icons.add,
          size: 25,
          color: whitecolor,
        ),
      ),
    );
  }
}
