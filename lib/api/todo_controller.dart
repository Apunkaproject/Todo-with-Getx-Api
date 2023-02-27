import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:todo/api/todo_model.dart';

class TodoController extends GetxController {
  var todoList = RxList<TodoModel>();
  RxBool isLoading = false.obs;
  String Base_url = "https://63e9ccf2e0ac9368d644794c.mockapi.io/api/todos";
  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  // get todo
  Future<RxList<TodoModel>> getTodos() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(Base_url));

    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        todoList.add(
          TodoModel.fromJson(index),
        );
      }
      isLoading.value = false;
      return todoList;
    } else {
      isLoading.value = false;
      return todoList;
    }
  }

// Post todos
  Future<void> postTodos(title) async {
    isLoading.value = true;
    final response = "".obs;
    final res = await http.post(
      Uri.parse(Base_url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"todoTitle": title}),
    );
    if (res.statusCode == 201) {
      response.value = res.body;
      todoList.clear();
      getTodos();
      update();
      isLoading.value = false;
    } else {
      print("Faild");
    }
  }

  Future<void> deleteTodo(id) async {
    isLoading.value = true;
    final response = "".obs;
    final res = await http.delete(
      Uri.parse(Base_url + id),
    );
    if (res.statusCode == 200) {
      response.value = res.body;
      todoList.clear();
      getTodos();
      update();
      isLoading.value = false;
    } else {
      print("Faild");
    }
  }

  Future<void> updateTodo(id, title) async {
    final response = "".obs;
    final res = await http.put(
      Uri.parse("https://63e9ccf2e0ac9368d644794c.mockapi.io/api/todos$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"todoTitle": title}),
    );
    if (res.statusCode == 201) {
      response.value = res.body;
      todoList.clear();
      getTodos();
      update();
    } else {
      print("Faild");
    }
  }
}
