// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:siakad_app/common/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType? textInputType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.onChanged,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: textInputType,
      cursorColor: ColorResource.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusColor: ColorResource.primary,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: ColorResource.primary,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
