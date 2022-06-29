import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        Material(
      borderRadius: BorderRadius.circular(25),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
          //padding: EdgeInsets.symmetric(horizontal: 20),
          minWidth: double.infinity,
          height: 50,
          color: color,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: onPress),
    );
  }
}
