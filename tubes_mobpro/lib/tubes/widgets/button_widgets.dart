import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 266,
      height: 40,
      child: TextButton(
        onPressed: () { },
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF009DFF),
        ),
        child: Text(label, 
        style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
          )),
      ),
    );
  }
}