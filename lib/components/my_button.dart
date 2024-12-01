import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Text text;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    });
  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Color(0xFFE2642C),//Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}