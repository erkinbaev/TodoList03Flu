import 'package:flutter/material.dart';
import 'package:todo_list_03flu/add/add_page.dart';
import 'package:todo_list_03flu/database/app_database.dart';
import 'package:todo_list_03flu/database/app_repository.dart';
import 'package:todo_list_03flu/home/home_state.dart';
import 'package:todo_list_03flu/home/home_view_model.dart';
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_list_03flu/todo.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final HomeCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Home page initState");
    //Здесь запускаются таймеры или анимации
    //Подтягивать данные с локального хранения или с интернета

    final db = AppDatabase();
    final repo = AppRepositoryImpl(db);
    final vm = HomeViewModel(repo: repo);
    cubit = HomeCubit(vm: vm);
    cubit.fetchList();
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
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.isError) {
              return Center(child: Text("Возникла ошибка при работе с данными!"));
            } else if (state.items.isEmpty) {
              return Center(child: Text("Ваш список задач пуст"));
            }

              return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child:
        ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final todo = state.items[index];
                return ListTile(
                  title: Text(todo.title),
                );
              }
              ),
        ),
       
      floatingActionButton: FloatingActionButton(
        onPressed: _naviagateToAddPage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );


          },
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   print("Home page build");
  
  // }

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

extension on Random {
  void nextInt(int length) {

  }
}