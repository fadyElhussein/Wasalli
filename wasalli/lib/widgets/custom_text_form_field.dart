import 'package:flutter/material.dart';
import 'package:wasalli/const/const.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      required this.keyboardType,
      required this.readOnly,
      this.onFieldSubmitted,
      required this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false});
  final bool readOnly;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String?)? onFieldSubmitted;
  final String text;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: (data) {
        if (data?.isEmpty ?? true) {
          return 'field is required';
        }
        return null;
      },
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        labelText: text,
        labelStyle: const TextStyle(color: kPrimaryColor),
        contentPadding: const EdgeInsets.all(25.0),
        prefixIcon: prefixIcon,
        prefixIconColor: Colors.grey,
        suffixIconColor: Colors.grey,
        suffixIcon: suffixIcon,
        border: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      8,
    ),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}
