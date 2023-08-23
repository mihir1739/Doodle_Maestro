import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController Controller;
  final String hintText;
  const CustomTextField({Key? key, required this.Controller, required this.hintText }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent )
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
        filled: true,
        fillColor: const Color(0xffF5F5FA),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w100
        )
      ),
    );
  }
}