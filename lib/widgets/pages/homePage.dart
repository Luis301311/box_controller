import 'package:box_controller/widgets/customDateField.dart';
import 'package:box_controller/widgets/customProductField.dart';
import 'package:box_controller/widgets/text_edi_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cantController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion De productos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column( 

          children: [
            CustomProductField(
              hintText: "Producto", 
              controller: _productController,
              products: ["Laptop", "Celular", "Tablet", "Impresora", "Mouse"],
              ),
            SizedBox( height: 30,),
            CustomDateField(
              hintText: "Fecha", 
              controller: _dateController
              ),
            SizedBox( height: 30,),
            CustomTextField(
              hintText: "Cantidad", 
              controller: _cantController
              ),
            SizedBox( height: 30,),
            ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF17733F),
                minimumSize: Size(300, 60)
              ),
              child: Text("Guardar", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),))
          ],
        ),
      )
    );
  }
}