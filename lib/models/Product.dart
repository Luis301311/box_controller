class Product {
  String id; 
  String name;
  int quantity;
  String value;

  Product({
    required this.id,
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

  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
      id: map['id'],
      value: map['value'], 
      quantity: map['quantity'], 
      name: map['name']);
  }
}