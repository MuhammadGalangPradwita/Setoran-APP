import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldWidget extends StatelessWidget {
  final String? label;
  // final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? obscureCharacter;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const TextfieldWidget({
    super.key,
    this.label = "",
    // required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscureCharacter = "*",
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Builder(builder: (context) {
        if (label != "") {
          return Text(
            label!,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
      Gap(label != "" ? 4 : 0),
      TextFormField(
        // controller: controller,
        keyboardType: keyboardType!,
        obscureText: obscureText!,
        obscuringCharacter: obscureCharacter!,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          filled: false,
          // fillColor: const Color.fromARGB(255, 27, 91, 22),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: const Color.fromARGB(255, 129, 129, 129),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 129, 129, 129),
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 129, 129, 129),
                width: 1.0,
              )),
        ),
      ),
    ]);
  }
}
