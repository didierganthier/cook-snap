import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? Function(String?)? validator;
  const InputField({super.key, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        labelText: 'Email',
        hintText: 'Enter your email',
      ),
    );
  }
}
