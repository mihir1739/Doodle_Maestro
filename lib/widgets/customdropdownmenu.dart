import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> items;
  CustomDropdownMenu({Key? key, required this.items}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
            focusColor: const Color(0xffF5F6FA),
            items: <String>["2","5","7","10"]
            .map<DropdownMenuItem<String>>(
              (String val) => DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                  style: TextStyle(color: Colors.black),
                  ),
                  )).toList(),
                  hint: const Text("Select Number of Rounds",
                    style: TextStyle(color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),),
          onChanged: (String? value) {
            print(value);
          });
  }
}