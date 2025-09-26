import 'package:flutter/material.dart';

class CustomProductField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String> products;

  const CustomProductField({
    required this.hintText,
    required this.controller,
    required this.products,
  });

  @override
  _CustomProductFieldState createState() => _CustomProductFieldState();
}

class _CustomProductFieldState extends State<CustomProductField> {
  List<String> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = widget.products;
  }

  void _openProductSelector() async {
    FocusScope.of(context).unfocus(); // cerrar teclado

    String? selected = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        TextEditingController searchController = TextEditingController();
        List<String> tempList = List.from(widget.products);

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Buscar producto...",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setModalState(() {
                          tempList = widget.products
                              .where((p) =>
                                  p.toLowerCase().contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  // Lista de productos
                  Expanded(
                    child: ListView.builder(
                      itemCount: tempList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(tempList[index]),
                          onTap: () => Navigator.pop(context, tempList[index]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (selected != null) {
      setState(() {
        widget.controller.text = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true, // 👈 no se escribe, solo selecciona
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
        suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
      ),
      onTap: _openProductSelector,
    );
  }
}
