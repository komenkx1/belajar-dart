import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CInput extends StatelessWidget {
  //parameter stateless
  final String? label;
  const CInput({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: label),
    );
  }
}
