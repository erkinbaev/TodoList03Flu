import 'package:flutter/material.dart';
import 'package:todo_list_03flu/add/add_page.dart';
import 'dart:math';

import 'package:todo_list_03flu/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String text = "Hello";
  bool isVisible = true;
  List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.yellow, Colors.black];
  Color currentColor = Colors.blue;
  List<Todo> todoList = [Todo(id: 1, title: "сделать дз 1", date: "01.01.2026", isDone: true), Todo(id: 2, title: "сделать дз 1", date: "03.02.2026", isDone: true),
  Todo(id: 1, title: "сделать дз 1", date: DateTime.now().toString(), isDone: true), Todo(id: 1, title: "сделать дз 1", date: "24.01.2026", isDone: true)];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home page initState");
    //Здесь запускаются таймеры или анимации
    //Подтягивать данные с локального хранения или с интернета
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
      print("Home page didChangeDependencies");
    //Метод срабатывает когда меняются глобальные параметры: язык приложения или тема приложения
  }
  
  @override
  Widget build(BuildContext context) {
    print("Home page build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:
        ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return ListTile(
                  title: Text(todo.title),
                );
              }
              ),
        ),
       
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: .center,
      //     children: [
      //       Text(text),
      //       Visibility(
      //         child: Text("text to show and hide"),
      //         visible: isVisible,
      //       ),
      //       Container(
      //         width: 300,
      //         height: 200,
      //         color: currentColor,
      //       ),
      //       TextButton(onPressed: _updateUI, child: Text("Скрыть"))
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _naviagateToAddPage() async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (_) => const AddPage()));
    if (result != null) {
      print("текст со второго экрана: $result");
    }
  }

  void _changeText() {
    if (text == "hello") {
      setState(() {
        text = "hi";
      });
    } else {
      setState(() {
        text = "hello";
      });
    }
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  void _randomColor() {
    setState(() {
      currentColor = colors[Random().nextInt(colors.length)];
    });
  }

  void _updateUI() {
    _changeText();
    _toggleVisibility();
    _randomColor();
  }


  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Home page didUpdateWidget");
    //когда мы используем кастомные виджеты и надо поменять значение 
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("Home page deactivate");
    //срабатывает перед тем как экран пропадет с виду, но в памяти еще хранится
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Home page dispose");
    //уничтожает экран и здесь надо выключать фоновые задачи

  }
}

extension on Random {
  void nextInt(int length) {

  }
}