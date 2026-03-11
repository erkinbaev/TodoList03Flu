
import 'package:flutter/material.dart';

class Todo {
  final int id;
  final String title;
  final bool isDone;
  final String date;
//  final Color color = Colors.amber;
//  final TodoColor color;

  Todo({required this.id, required this.title, required this.date, required this.isDone});
}

class TodoColor {
 int r = 0;
 int g = 0;
 int b = 0;
}