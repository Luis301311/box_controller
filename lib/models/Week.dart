import 'package:box_controller/models/Day.dart';

class Weeks {
  DateTime startDate;
  DateTime endDate;
  List<Day> days;
  String status; 

  Weeks({
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.status
  });

  Map <String, dynamic> tomap(){
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'days': days.map((e)=> e.tomap()).toList(),
      'status' : status,
    };
  }

  factory Weeks.fromMap(Map<String, dynamic> map){
    return Weeks(
      startDate: map['startDate'], 
      endDate: map['endDate'], 
      days: (map['days'] as List).map((e) => Day.fromMap(e)).toList(), 
      status: map['status']
      );
  }

  double get total => days.fold(0, (sum, d) => sum + d.totalQuantity); 
  
}