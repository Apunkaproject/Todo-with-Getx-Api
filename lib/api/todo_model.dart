
class TodoModel {
  String? todoTitle;
  String? id;

  TodoModel({this.todoTitle, this.id});

  TodoModel.fromJson(Map<String, dynamic> json) {
    todoTitle = json["todoTitle"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["todoTitle"] = todoTitle;
    _data["id"] = id;
    return _data;
  }
}