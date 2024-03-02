import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasalli/const/const.dart';
import 'package:wasalli/views/login_view.dart';
import 'package:wasalli/widgets/custom_snooth_page_indicator.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String id = 'onBoardinView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                      title: const Text(
                        'Are You Sure to Skip?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                LoginView.id,
                                (route) => false,
                              );
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(color: kPrimaryColor),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(color: kPrimaryColor),
                            )),
                      ]),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: kPrimaryColor),
              )),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: CustomSmoothPageIndicator(),
      ),
    );
  }
}
