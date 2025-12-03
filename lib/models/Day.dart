import 'dart:ffi';

import 'package:box_controller/models/Product.dart';

class Day {
  DateTime date;
  String name; 
  List<Product> products; 
  double value; 


  Day({
    required this.date,
    required this.name,
    required this.products,
    required this.value
  });

  int get totalQuantity {
    return products.fold(0, (sum, p)=> sum  + p.quantity); 
  }

  Map <String, dynamic> tomap(){
    return {
      'date': date,
      'name': name,
      'products': products.map((e) => e.tomap()).toList(),
      'value' : value,
    };
  }

  factory Day.fromMap(Map<String, dynamic> map){
    return Day(
      date: map['date'],
      name: map['name'],
      products: (map['products'] as List).map((e) => Product.fromMap(e)).toList(), 
      value: map['value']
      );
  }
}
