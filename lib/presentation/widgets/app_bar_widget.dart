import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/colors/colors.dart';
import 'package:flutter_application_2/core/contans.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: GoogleFonts.montserrat()
                .copyWith(fontSize: 30, fontWeight: FontWeight.w900)),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          color: kButtonColorBlue
        ),
        kwidth
      ],
    );
  }
}
