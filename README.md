
# Todo Android App With Getx (API)

In this app i have used Api `get` , `post` , and `delete` method of **API** with the help of **Getx** 





## Screenshots

![App Screenshot](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEivJBSMswXwV4A0S-At3oWkrIIHwl5fX3S3R81hQWxW3ZHdgv3DERz5gonyPC-XwV60b4FdAYve_3aaj0c9sWMeiXU8plzm3S5e4Gix6Zk5Z1xBP8XHQ0qpsYWCAMi3uyRM14JUA3aeBadnJgZhruIdxnyecB0ynoq5Trb4s2Nr7onWz8PRv3E5pSc2Ig/s854/Screenshot%202023-02-28%20020243.png)
![App Screenshot](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh0Ynf5j-dGoPggLdQ-VlmLtKeQzw-6zgztmefBBA982tU3TERAXOy5ZY0QIQBeHUYAJM4qd-mEygYGu09DJ2xcU7Uzx1G9asfw8eXBs4KY9rN1K5Om16-N2YIE_40avNCO4coj4CsfJ4NEJ6cvidVnYxjw3SeV_bN4inbQ-MaxuLpcfleN2XnCZ1Jpbg/s851/Screenshot%202023-02-28%20020307.png)


## Demo

https://youtu.be/BmV1TgI6MKo


## Language used

**Front End:** Flutter

**Server:** Mock Api

### Api Guide


### Get Api
```
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

```
### Post Api
```
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
  ```
  ### Delete Api
  ```
  
// Delete Todo
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
```
### Update Api
``` 

// Update Todo
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
```



## Roadmap

- Additional browser support

- Add more integrations

