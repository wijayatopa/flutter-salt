import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final func;
  final String label;
  const ButtonComponent({super.key, this.func, required this.label });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: func, child: Text(label));
  }
}