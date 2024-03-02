import 'package:flutter/material.dart';
import 'package:wasalli/const/const.dart';
import 'package:wasalli/model/boarding_iteam_model.dart';

class BoardingIteams extends StatelessWidget {
  const BoardingIteams({super.key, required this.model});
  final  BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.title,
          style: const TextStyle(
            fontSize: 24.0,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          model.body,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
