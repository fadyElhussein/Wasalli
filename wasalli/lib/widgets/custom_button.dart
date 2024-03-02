import 'package:flutter/material.dart';
import 'package:wasalli/const/const.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  final double width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      color: kPrimaryColor,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
