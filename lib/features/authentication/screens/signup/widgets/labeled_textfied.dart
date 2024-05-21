import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isRequired;
  final String? Function(String?)? validator;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  

  const LabeledTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.isRequired = false, // to show red *
    this.validator, 
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        TextFormField(
          controller: controller,
          validator: validator,
          expands: false,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon
          ),
        ),
        if (isRequired)
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '*',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
              ),
            ),
          ),
      ],
    );
  }
}
