import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo/api/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  var todoList = RxList<TodoModel>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

// Get todo
  Future<RxList<TodoModel>> getTodos() async {
    isLoading.value = true;
    final response = await http.get(
        Uri.parse("https://63e9ccf2e0ac9368d644794c.mockapi.io/api/todos"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        todoList.add(TodoModel.fromJson(index));
      }
      isLoading.value = false;
      return todoList;
    } else {
      return todoList;
    }
  }

// Post Todo
  Future<void> postTodo(title) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse("https://63e9ccf2e0ac9368d644794c.mockapi.io/api/todos"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(
        {"todoTitle": title},
      ),
    );
    if (response.statusCode == 201) {
      print("Done");
      todoList.clear();
      getTodos();
      isLoading.value = false;
    } else {
      print('Faild');
    }
  }

  // Delete Todo
  Future<void> deleteTodo(id) async {
    isLoading.value = true;
    final response = await http.delete(
      Uri.parse("https://63e9ccf2e0ac9368d644794c.mockapi.io/api/todos/$id"),
    );
    if (response.statusCode == 200) {
      print("Done");
      todoList.clear();
      getTodos();
      isLoading.value = false;
    } else {
      print('Faild');
    }
  }
}
