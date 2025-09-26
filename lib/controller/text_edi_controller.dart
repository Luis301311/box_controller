// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  CustomTextField({
    required this.hintText,
    required this.controller,
    this.isPassword = false, // Por defecto no es un campo de contraseña
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // Para campos de contraseña

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: const TextStyle(color: Color(0xFF89908F)),
        filled: true,
        fillColor:  Color(0xFFEAEDEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF0c6c28)),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null, // No mostrar icono si no es un campo de contraseña
      ),
    );
  }
}
