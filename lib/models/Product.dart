class Product {
  String name;
  int quantity;
  String value;

  Product({
    required this.value,
    required this.quantity,
    required this.name,
  });

  Map <String, dynamic> tomap(){
    return {
      'name' : name,
      'quantity' : quantity,
      'value' : value,
    };
  }
}