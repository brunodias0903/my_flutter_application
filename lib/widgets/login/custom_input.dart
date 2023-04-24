import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintMessage;
  final Function(String) onChanged;
  final bool obscure;

  const CustomInput({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.hintMessage,
    required this.onChanged,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintMessage,
        ),
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
