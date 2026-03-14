
import 'package:todo_list_03flu/database/app_database.dart';
import 'package:todo_list_03flu/todo.dart';

abstract class AppRepository {
  //набор доступных функция для работы с хранилищем (обертка над хранилищем)

  Future<List<Todo>> getList();
}

class AppRepositoryImpl extends AppRepository {
  //ccылка на хранилище
  final AppDatabase db;

  AppRepositoryImpl(this.db);

  @override
  Future<List<Todo>> getList() => db.getList();
}

