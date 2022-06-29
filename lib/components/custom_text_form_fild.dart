import 'package:flutter/material.dart';

class MyTextFormFild extends StatelessWidget {
  final String labelText;
  bool obScureText = false;
  final TextEditingController;
  final TextInpurType;
  final validation;

  MyTextFormFild(
      {Key? key,
      required this.TextEditingController,
      required this.obScureText,
      required this.labelText,
      required this.TextInpurType,
      this.validation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        keyboardType: TextInpurType,
        controller: TextEditingController,
        obscureText: obScureText,
        decoration: InputDecoration(
            fillColor: Color.fromARGB(255, 251, 251, 251),
            labelText: labelText,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(25))),
        validator: validation,
      ),
    );
  }
}
