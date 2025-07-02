import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? Function(String?)? validator;
  final VoidCallback? onTap; // Added for date picker

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          suffixIcon: onTap != null
              ? IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: onTap,
                )
              : null,
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập $labelText';
              }
              return null;
            },
      ),
    );
  }
}
