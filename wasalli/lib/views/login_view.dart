import 'package:flutter/material.dart';
import 'package:wasalli/const/const.dart';
import 'package:wasalli/views/register_view.dart';
import 'package:wasalli/widgets/custom_button.dart';
import 'package:wasalli/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'loginScreen';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool passwordvisable = true;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/Logo.png',
          height: 140,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomTextFormField(
                    controller: emailcontroller,
                    readOnly: false,
                    keyboardType: TextInputType.emailAddress,
                    text: 'Email Address',
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: passwordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    text: "Password",
                    prefixIcon: const Icon(Icons.password),
                    obscureText: passwordvisable,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordvisable = !passwordvisable;
                          });
                        },
                        icon: passwordvisable
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\tt  have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.id);
                        },
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomButton(
                      text: 'Sing in',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
