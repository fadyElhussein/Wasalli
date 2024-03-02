import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasalli/const/const.dart';
import 'package:wasalli/model/boarding_iteam_model.dart';
import 'package:wasalli/views/login_view.dart';
import 'package:wasalli/widgets/boarding_iteam.dart';

class CustomSmoothPageIndicator extends StatefulWidget {
  const CustomSmoothPageIndicator({super.key});

  @override
  State<CustomSmoothPageIndicator> createState() =>
      _CustomSmoothPageIndicatorState();
}

class _CustomSmoothPageIndicatorState extends State<CustomSmoothPageIndicator> {
  PageController boardController = PageController();
  bool isLast = false;
  List<BoardingModel> boardingList = [
    BoardingModel(
        image: 'assets/images/Logo.png',
        title: 'ORDER ONLINE ',
        body: 'make your order sitting on a Sofa.\n play and choose online'),
    BoardingModel(
        image: 'assets/images/Logo.png',
        title: 'ORDER ONLINE ',
        body: 'make your order sitting on a Sofa.\n play and choose online'),
    BoardingModel(
        image: 'assets/images/Logo.png', title: 'DELIVERY SERVICES', body: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (index) {
              if (index == boardingList.length - 1) {
                setState(() {
                  isLast = true;
                });
              } else {
                setState(() {
                  isLast = false;
                });
              }
            },
            controller: boardController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) =>
                BoardingIteams(model: boardingList[index])),
            itemCount: boardingList.length,
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
        Row(
          children: [
            SmoothPageIndicator(
              controller: boardController,
              count: boardingList.length,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: kPrimaryColor,
              ),
            ),
            const Spacer(),
            isLast
                ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, LoginView.id);
                    },
                    child: const Text(
                      "يلا بينا ",
                      style: TextStyle(color: kPrimaryColor, fontSize: 24),
                    ),
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      boardController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.decelerate,
                      );
                    },
                    child: Image.asset('assets/images/Logo.png'),
                  ),
          ],
        )
      ],
    );
  }
}
