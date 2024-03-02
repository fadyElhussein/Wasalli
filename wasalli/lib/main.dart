import 'package:flutter/material.dart';
import 'package:wasalli/views/login_view.dart';
import 'package:wasalli/views/on_boarding_view.dart';
import 'package:wasalli/views/register_view.dart';
import 'package:wasalli/views/splash_view.dart';

void main() {
  runApp(const Wasalli());
}

class Wasalli extends StatelessWidget {
  const Wasalli({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasalli - وصلّي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
        SplashView.id: (context) => const SplashView(),
      },
      initialRoute: OnBoardingView.id,
    );
  }
}
