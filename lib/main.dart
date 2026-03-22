import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_03flu/database/app_database.dart';
import 'package:todo_list_03flu/home/home_page.dart';

late final AppDatabase appDatabase;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  appDatabase = AppDatabase();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  late SharedPreferences preferences;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  void _getPreferences() async {
    //достать настройки по ключу
  }
}