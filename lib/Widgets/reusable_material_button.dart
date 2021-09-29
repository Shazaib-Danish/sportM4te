import 'package:flutter/material.dart';


class ReusableMaterialButton extends StatelessWidget {
  const ReusableMaterialButton({required this.title, required this.onPressed});

  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: MaterialButton(
        minWidth: double.infinity,
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(title, style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
