import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.label, required this.press});

  final String label;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF009DFF),
      ),
      child: Text(label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFFFFFFF),
          )),
    );
  }
}

class ButtonOutlineWidget extends StatelessWidget {
  const ButtonOutlineWidget(
      {super.key, required this.label, required this.press, this.icon});

  final String label;
  final VoidCallback press;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: Color.fromARGB(255, 217, 217, 217),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            if (icon != null) {
              return Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                  ),
                  const Gap(8),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
          Text(label,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
