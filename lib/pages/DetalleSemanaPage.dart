import 'package:flutter/material.dart';

class DetalleSemanaPage extends StatelessWidget {
  final String week;
  final List<Map<String, dynamic>> days;
  final int total;

  const DetalleSemanaPage({
    super.key,
    required this.week,
    required this.days,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles - Semana $week"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Producción diaria",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),

            // Lista de días
            Expanded(
              child: ListView.builder(
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green.shade100,
                        child: Text(day['day'][0]),
                      ),
                      title: Text(day['day']),
                      subtitle: Text(
                          "${day['produccion']} unidades → \$${day['valor']}"),
                      trailing: Text(
                        "\$${day['valor']}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Total semanal
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total semana:",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("\$$total",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.green)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
