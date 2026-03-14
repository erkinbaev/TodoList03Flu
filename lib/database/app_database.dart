
import 'package:todo_list_03flu/todo.dart';

class AppDatabase {
  //MOCK - данные, временные данные
  List<Todo> _todoList = [
    // Todo(id: 1, title: "сделать дз 1", date: "01.01.2026", isDone: true), 
    // Todo(id: 2, title: "сделать дз 3", date: "03.02.2026", isDone: true),
    // Todo(id: 1, title: "сделать дз 2", date: DateTime.now().toString(), isDone: true), 
    // Todo(id: 1, title: "сделать дз 4", date: "24.01.2026", isDone: true)
    ];

  //CRUD - operations 

  //READ
  Future<List<Todo>> getList() async {
    return List.unmodifiable(_todoList);
  }

  //CREATE 

  //UPDATE

  //DELETE

}
