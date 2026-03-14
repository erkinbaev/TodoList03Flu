
import 'package:todo_list_03flu/todo.dart';

class HomeState {
  final List<Todo> items;
  final bool isError;

  const HomeState({required this.items, required this.isError});

  factory HomeState.initial() => const HomeState(items: [], isError: false);

  HomeState copyWith({
    List<Todo>? items,
    bool? isError
  }) {
    return HomeState(items: items ?? this.items, isError: isError ?? this.isError);
  }
}

