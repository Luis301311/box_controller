import 'dart:ffi';
import 'package:box_controller/models/Day.dart';

class Weeks {
  String week;
  List<Day> day;
  Float total;
  String status; 

  Weeks({
    required this.week,
    required this.day,
    required this.total,
    required this.status
  });

  Map <String, dynamic> tomap(){
    return {
      'week': week,
      'day': day.map((e)=> e.tomap()).toList(),
      'total' : total,
      'status' : status,
    };
  }
}