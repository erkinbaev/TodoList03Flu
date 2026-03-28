
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_03flu/database/app_database.dart';
import 'package:todo_list_03flu/main.dart';

class AddPage extends StatefulWidget {

  const AddPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddPage();
}

class _AddPage extends State<AddPage> {
  late Timer _timer;
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Add page initState");
    //Здесь запускаются таймеры или анимации
    //Подтягивать данные с локального хранения или с интернета

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("${date.minute}: ${date.second}");
    });

    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
      print("Add page didChangeDependencies");
    //Метод срабатывает когда меняются глобальные параметры: язык приложения или тема приложения

  }

  @override
  Widget build(BuildContext context) {
    print("Add page build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Новая задача"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Название задачи",
              border: OutlineInputBorder()
            ),
          ),
          TextButton(
            onPressed: () => _saveTodo() , 
              child: Text("Сохранить")
              )
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AddPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Add page didUpdateWidget");
    //когда мы используем кастомные виджеты и надо поменять значение 
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Add page deactivate");
    //срабатывает перед тем как экран пропадет с виду, но в памяти еще хранится
  }

  void _saveTodo() async {
    try {
        await appDatabase.insertTodo(TodosCompanion.insert(
              title: _controller.text, 
              date: DateTime.now().toString()));
          await showAppSnackBar(context, text: "Сохранено!", backgroundColor: Colors.green, icon: Icons.check);
          Future.delayed(Duration(seconds: 2), () => Navigator.pop(context));
    } catch (e) {
      showAppSnackBar(context, text: "Должно быть минимум 3 символа!", backgroundColor: Colors.red, icon: Icons.error);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Add page dispose");
    _timer.cancel();
    //уничтожает экран и здесь надо выключать фоновые задачи, таймеры и т.д

  }

  Future <void> showAppSnackBar(
  BuildContext context, {
  required String text,
  Color? backgroundColor,
  IconData? icon,
  VoidCallback? onRetry,
  String retryText = "Повторить",
}) async {
  final messenger = ScaffoldMessenger.of(context);

  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
          ],
          Expanded(child: Text(text)),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 400),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      duration: const Duration(seconds: 1),
      action: onRetry == null
          ? null
          : SnackBarAction(
              label: retryText,
              onPressed: onRetry,
              textColor: Colors.white,
            ),
    ),
  );
}
}