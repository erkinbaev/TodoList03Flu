
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool _isDarkThemeOn = false;
  late SharedPreferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Настройки"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("Темная тема"),
              Spacer(),
              Switch(value: _isDarkThemeOn, onChanged: (v) {
                setState(() {
                  _isDarkThemeOn = v;
                  _setPreferences();
                });
              })
            ],
          )
        ],
      ),
    );
  }

  void _setPreferences() async {
    preferences.setBool('isDarkTheme', _isDarkThemeOn);
    preferences.setString('code', '4244');
    preferences.setInt('progress', 60);
  }

  void _getPreferences() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      _isDarkThemeOn = preferences.getBool('isDarkTheme') ?? false;
    });
  }
}