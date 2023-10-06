// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/firebase_auth_services.dart';
import '../widgets/email_password_field_widget.dart';
import '../widgets/pop_button_widget.dart';
import '../widgets/xmark_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final FirebaseAuthService _auth = FirebaseAuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [XmarkButtonWidget()],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(size20),
                child: SvgPicture.asset(
                  'assets/images/svglogo3.svg',
                  height: size200,
                ),
              ),
            ),
            EmailFieldWidget(emailController: _emailController),
            PasswordFieldWidget(
              passController: _passController,
            ),
            PopButtonWidget(
              title: loginTitle,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint('Successful');
                  _signIn();
                  _emailController.clear();
                  _passController.clear();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('You registered successfully!'),
                      actions: [
                        PopButtonWidget(
                          title: 'Go to Home',
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passController.text;

    User? user = await _auth.logIn(email, password);
  }
}
