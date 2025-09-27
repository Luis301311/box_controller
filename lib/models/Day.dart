import 'dart:ffi';

import 'package:box_controller/models/Product.dart';

class Day {
  String name; 
  List<Product> products; 
  Float value; 


  Day({
    required this.name,
    required this.products,
    required this.value
  });

  int get totalQuantity {
    return products.fold(0, (sum, p)=> sum  + p.quantity); 
  }

  Map <String, dynamic> tomap(){
    return {
      'name': name,
      'products': products.map((e) => e.tomap()).toList(),
      'value' : value,
    };
  }
}
