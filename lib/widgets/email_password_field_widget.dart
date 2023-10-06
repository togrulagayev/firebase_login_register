import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';

///E-mail

class EmailFieldWidget extends StatefulWidget {
  const EmailFieldWidget({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(size10),
      child: TextFormField(
        controller: widget._emailController,
        keyboardType: mailType,
        decoration: const InputDecoration(
          labelText: 'E-mail',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(size30),
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(size20),
            child: FaIcon(FontAwesomeIcons.solidEnvelope),
          ),
          prefixIconConstraints: BoxConstraints.tightFor(),
          prefixIconColor: primaryPurpleColor,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          final bool isValid = EmailValidator.validate(value!);
          if (value.isEmpty) {
            return 'Enter your e-mail!';
          } else if (!isValid) {
            return 'Enter valid e-mail!';
          }
          return null;
        },
        // onSaved: (newValue) => _email = newValue,
      ),
    );
  }
}

///Password

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({
    super.key,
    required TextEditingController passController,
  }) : _passController = passController;

  final TextEditingController _passController;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _passVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(size10),
      child: TextFormField(
        controller: widget._passController,
        keyboardType: mailType,
        obscureText: _passVisibility,
        decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(size30),
              ),
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(size20),
              child: FaIcon(FontAwesomeIcons.lock),
            ),
            prefixIconConstraints: const BoxConstraints.tightFor(),
            prefixIconColor: primaryPurpleColor,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passVisibility = !_passVisibility;
                });
              },
              icon: FaIcon(
                _passVisibility
                    ? FontAwesomeIcons.eyeSlash
                    : FontAwesomeIcons.eye,
              ),
            ),
            suffixIconColor: primaryPurpleColor,
            suffixIconConstraints: const BoxConstraints.tightFor()),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: ((value) {
          if (value!.length <= 5) {
            return 'Password length should not be less then 6 characters.';
          }
          return null;
        }),
      ),
    );
  }
}
