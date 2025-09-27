import 'package:box_controller/pages/DetalleSemanaPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  final List<Map<String, dynamic>> weeks = [
    {
      "week": "12 - 18 Ago 2025",
      "days": [
        {"day": "Lunes", "produccion": 10, "valor": 20000},
        {"day": "Martes", "produccion": 15, "valor": 30000},
        {"day": "Miércoles", "produccion": 20, "valor": 40000},
      ],
      "total": 90000,
      "status": "pendiente"
    },
    {
      "week": "5 - 11 Ago 2025",
      "days": [
        {"day": "Lunes", "produccion": 12, "valor": 24000},
        {"day": "Martes", "produccion": 8, "valor": 16000},
      ],
      "total": 40000,
      "status": "pagado"
    },
  ];


    

  Color getStatusColor(String status) {
    switch (status) {
      case "pagado":
        return Colors.green;
      case "pendiente":
        return Colors.orange;
      case "en mora":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión Financiera"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            // Resumen
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text("Resumen semanal",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 8),
                    Text("Total producido: \$120,000"),
                    Text("Pendiente de pago: \$80,000"),
                  ],
                ),
              ),
              
            ),
            const SizedBox(height: 12),

            // Lista de semanas
            ...weeks.map((week) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Encabezado semana
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Semana ${week['week']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 10),
                            decoration: BoxDecoration(
                              color: getStatusColor(week['status']),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              week['status'].toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      // Días de producción
                      Column(
                        children: (week['days'] as List).map((day) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(day['day']),
                              Text(
                                  "${day['produccion']} unidades → \$${day['valor']}"),
                            ],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      Text("Total semana: \$${week['total']}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(()=> DetalleSemanaPage(week: "12 - 18 Ago 2025",
                                  days: [
                                    {"day": "Lunes", "produccion": 10, "valor": 20000},
                                    {"day": "Martes", "produccion": 15, "valor": 30000},
                                    {"day": "Miércoles", "produccion": 20, "valor": 40000},
                                  ],
                                  total: 90000,));
                                  
                                
                              },
                              child: const Text("Detalles")),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () {},
                            child: const Text("Pagar"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
