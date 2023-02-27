import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/api/todo_controller.dart';
import 'package:todo/config/constant.dart';
import 'package:todo/widgets/floating_button.dart';

import '../widgets/MyBottomSheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    return Scaffold(
        floatingActionButton: FloatingButton(),
        body: Center(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      "Tasks",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Obx(
                  () => todoController.isLoading.value
                      ? Lottie.network(
                          "https://assets2.lottiefiles.com/packages/lf20_gbfwtkzw.json")
                      : SingleChildScrollView(
                          child: InkWell(
                            onTap: () {
                              Get.bottomSheet(MyBottomSheet());
                            },
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: todoController.todoList
                                  .map((e) => Container(
                                        margin: EdgeInsets.all(10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: whitecolor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: RichText(
                                                    text: TextSpan(
                                                  text: e.todoTitle.toString(),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                )),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  todoController
                                                      .deleteTodo(e.id);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: whitecolor,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          )),
        ));
  }
}
