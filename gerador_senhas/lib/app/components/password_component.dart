import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneratedPassword extends StatelessWidget {
  final TextEditingController controller;

  const GeneratedPassword({super.key, required this.controller});


  @override
  Widget build(BuildContext context) {
    return TextField(
    controller: controller,
    readOnly: true,
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 20.0),
    decoration: InputDecoration(
        icon: IconButton(
            icon: const Icon(Icons.copy),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: controller.text));
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Copied to clipboard'),
              ));
            }),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        )),
    );
  }
}
