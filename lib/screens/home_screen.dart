import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/pop_button_widget.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(size20),
            child: Center(
              child: SvgPicture.asset(svgLogoPath, height: size200),
            ),
          ),
          PopButtonWidget(
            title: loginTitle,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
                  ),
                );
              },
              child: Text(
                registerTitle,
                style: textStyle.copyWith(fontSize: size15),
              ))
        ],
      ),
    );
  }
}
