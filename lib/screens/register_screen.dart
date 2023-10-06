// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/services/firebase_auth_services.dart';
import 'package:flutter_application_1/widgets/pop_button_widget.dart';
import 'package:flutter_application_1/widgets/xmark_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/email_password_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
                child: SvgPicture.asset('assets/images/svglogo.svg',
                    height: size200),
              ),
            ),
            EmailFieldWidget(emailController: _emailController),
            PasswordFieldWidget(
              passController: _passController,
            ),
            PopButtonWidget(
              title: 'Create accaunt',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint('Successful');
                  _signUp();
                  _emailController.clear();
                  _passController.clear();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('You registered successfully!'),
                      actions: [
                        PopButtonWidget(
                          title: 'Tap to Login',
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
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

  void _signUp() async {
    String email = _emailController.text;
    String password = _passController.text;

    User? user = await _auth.signUp(email, password);
  }
}
