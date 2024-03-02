import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wasalli/const/const.dart';
import 'package:wasalli/widgets/custom_button.dart';
import 'package:wasalli/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String id = 'registerView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController conformpasswordcontroller = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController fFamilyNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool passwordvisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(kAppName),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: fnameController,
                    keyboardType: TextInputType.name,
                    text: 'First Name',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: fFamilyNameController,
                    keyboardType: TextInputType.name,
                    text: 'Family Name',
                    prefixIcon: const Icon(Icons.people),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: emailcontroller,
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
                  CustomTextFormField(
                    readOnly: false,
                    prefixIcon: const Icon(Icons.password),
                    controller: conformpasswordcontroller,
                    keyboardType: TextInputType.visiblePassword,
                    text: "Conform Password",
                    obscureText: passwordvisable,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: phoneController,
                    keyboardType: TextInputType.name,
                    text: 'National ID ',
                    prefixIcon: const Icon(FontAwesomeIcons.idCard),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: phoneController,
                    keyboardType: TextInputType.name,
                    text: 'Phone',
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  CustomTextFormField(
                    readOnly: false,
                    controller: phoneController,
                    keyboardType: TextInputType.name,
                    text: 'Address',
                    prefixIcon: const Icon(FontAwesomeIcons.locationCrosshairs),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  CustomButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Register',
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
