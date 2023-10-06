// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopop/neopop.dart';

import '../constants/constants.dart';

class PopButtonWidget extends StatelessWidget {
  void Function() onTap;
  String title;
  PopButtonWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(size20),
      child: NeoPopButton(
        color: primaryPurpleColor,
        onTapUp: onTap,
        onTapDown: () => HapticFeedback.vibrate(),
        buttonPosition: Position.center,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: size20, vertical: size10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.leagueSpartan().copyWith(fontSize: size20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
