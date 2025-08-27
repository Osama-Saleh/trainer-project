import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Color? inputTextColor;
  const CustomTextFormField({
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.controller,
    this.validator,
    this.borderColor,
    this.hintTextColor,
    this.labelTextColor,
    this.inputTextColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator ,
      style: TextStyle(color: inputTextColor ?? Colors.white),
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          hintText: hintText ?? 'typing...',
          hintStyle: TextStyle(
            color:hintTextColor ?? Colors.white,
          ),
          label: Text(labelText ?? 'Typing...'),
          labelStyle: TextStyle(
            color: labelTextColor ?? Colors.white,
            fontSize: 22,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color:borderColor?? Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor ?? Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red))),
    );
  }
}
