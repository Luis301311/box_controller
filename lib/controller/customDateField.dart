import 'package:flutter/material.dart';

class CustomDateField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const CustomDateField({
    required this.hintText,
    required this.controller,
  });

  @override
  _CustomDateFieldState createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true, // 👈 Para que no se pueda escribir
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: const TextStyle(color: Color(0xFF89908F)),
        filled: true,
        fillColor: const Color(0xFFEAEDEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF0c6c28)),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: const Icon(
          Icons.calendar_today,
          color: Colors.grey,
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          setState(() {
            widget.controller.text =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
          });
        }
      },
    );
  }
}
