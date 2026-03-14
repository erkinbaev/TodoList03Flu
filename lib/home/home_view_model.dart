import 'package:todo_list_03flu/database/app_repository.dart';
import 'package:todo_list_03flu/home/home_state.dart';
import 'package:todo_list_03flu/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel {
  final AppRepository repo;

  HomeViewModel({required this.repo});

  Future<List<Todo>> fetchList() => repo.getList();
}

//Подвязываем состояние с viewModel
class HomeCubit extends Cubit<HomeState> {
  final HomeViewModel vm;

  //фиксируем первоначальное состояние
  HomeCubit({required this.vm}) : super(HomeState.initial());

  Future<void> fetchList() async {
    try {
      final items = await vm.fetchList(); 
      //эти строки будут ждать завершения верхней строки, так как стоит await
      if (items.isEmpty) {
        emit(state.copyWith(items: [], isError: true));
      } else {
        emit(state.copyWith(items: items, isError: false));
      }
    } catch (e) {
      emit(state.copyWith(items: [], isError: true));
    }
  }
}
