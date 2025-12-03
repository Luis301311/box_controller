import 'package:box_controller/controller/weeks_controller.dart';
import 'package:box_controller/models/Day.dart';
import 'package:box_controller/models/Product.dart';
import 'package:box_controller/models/Week.dart';
import 'package:box_controller/widgets/customDateField.dart';
import 'package:box_controller/widgets/customProductField.dart';
import 'package:box_controller/widgets/text_edi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeeksController weeksController = Get.put(WeeksController()); // Controlador
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _cantController = TextEditingController();


  List<Product> newProductsList = []; 

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
              onPressed: (){
                Product product =  Product(
                  id: "1234sdqs",
                  value: '20000', 
                  quantity: int.parse(_cantController.text), 
                  name: _productController.text
                  );
                newProductsList.add(product); 
                
                _cantController.clear();
                _productController.clear();
                _dateController.clear();

              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF17733F),
                minimumSize: Size(300, 60)
              ),
              child: Text("Agregar", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),)),
            SizedBox( height: 30,),
            ElevatedButton(
              onPressed: (){
                saveDayinWeek();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF17733F),
                minimumSize: Size(300, 60)
              ),
              child: Text("Guardar y Salir", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30
              ),))
          ],
        ),
      )
    );
  }


  void  saveDayinWeek() async{
    List<Weeks> week =  await weeksController.filteredWeeks();
    DateTime today = DateTime.now();
    
    

    Day day = Day(
      date: today, 
      name: ' dasd', 
      products: newProductsList,  
      value: 1 );
    
    final weekRange = getWeekRange(today);
    Weeks weeks = Weeks(
      startDate: today, 
      endDate: today, 
      days: [], 
      status: '');
      
    weeksController.addWeeks(weeks);

  }

} 

Map<String, DateTime> getWeekRange(DateTime date) {
  // weekday en Dart: Lunes = 1 ... Domingo = 7
  int currentWeekday = date.weekday;

  // Restamos días para llegar al lunes
  DateTime startOfWeek = date.subtract(Duration(days: currentWeekday - 1));

  // Sumamos días para llegar al domingo
  DateTime endOfWeek = date.add(Duration(days: 7 - currentWeekday));

  return {
    "start": startOfWeek,
    "end": endOfWeek,
  };
}
