import 'package:box_controller/models/Day.dart';

class Weeks {
  DateTime startDate;
  DateTime? endDate;
  String? status; 

  Weeks({
    required this.startDate,
    this.endDate,
    this.status
  });

  Map <String, dynamic> tomap(){
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'status' : status,
    };
  }

  factory Weeks.fromMap(Map<String, dynamic> map){
    return Weeks(
      startDate: map['startDate'], 
      endDate: map['endDate'], 
      status: map['status']
      );
  }

}