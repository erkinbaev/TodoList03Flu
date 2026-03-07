
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
          TextButton(onPressed: () => Navigator.pop(context, _controller.text), child: Text("Сохранить"))
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Add page dispose");
    _timer.cancel();
    //уничтожает экран и здесь надо выключать фоновые задачи, таймеры и т.д

  }
}