import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;
  final TextInputType? keyboardType;

  const Editor({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(fontSize: 24.0),
      decoration: InputDecoration(
        icon: icon != null ? Icon(icon, color: Colors.green) : null,
        labelText: label,
        hintText: hint,
      ),
    );
  }
}