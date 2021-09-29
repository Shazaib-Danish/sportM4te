import 'package:flutter/material.dart';

class DrawerReusableChild extends StatelessWidget {
  const DrawerReusableChild(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.color,
      this.onPressed})
      : super(key: key);

  final String title;
  final IconData iconData;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                color: color,
                ),
                child: Icon(iconData,color: Colors.white,size: 20.0, ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(title, style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600
              ),),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right_outlined,size: 20.0,color: Colors.grey,)
            ],
          ),
        ),
      ),
    );
  }
}
