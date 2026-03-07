import 'package:flutter/material.dart';
import 'package:todo_list_03flu/add/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _naviagateToAddPage,
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
