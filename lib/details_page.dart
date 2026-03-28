
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_03flu/database/app_database.dart';
import 'package:todo_list_03flu/extensions/build_context_extension.dart';
import 'package:todo_list_03flu/main.dart';

class DetailsPage extends StatefulWidget{
  final Todo todo;
  const DetailsPage({super.key, required this.todo});

  @override
  State<StatefulWidget> createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController(text: widget.todo.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Детали"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Flex(direction: .vertical,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Название задачи",
              border: OutlineInputBorder()
            ),
          ),
          TextButton(onPressed: () => _updateTodo(), child: Text("Сохранить")),
          TextButton(onPressed: () => _deleteTodo(), child: Text("Удалить"))
        ],
        ),
        ),
    );
  }

  Future<void> _updateTodo() async {
    late final String newTitle;
    newTitle = _controller.text;
    try {
      await appDatabase.updateTodo(widget.todo.id, TodosCompanion(id: Value(widget.todo.id), title: Value(newTitle)));
      //await cubit.updateTodo();
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _deleteTodo() async {
    await appDatabase.deleteTodo(widget.todo.id);
    context.showAppSnackBar(context, text: "Удалено!", backgroundColor: Colors.green);
    Navigator.pop(context);
  }


}