import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget.primary(
      {super.key, required this.label, required this.press})
      : backgroundColor = AppColors.B400,
        color = AppColors.N0;

  final String label;
  final VoidCallback press;
  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        // style: TextButton.styleFrom(
        //   backgroundColor: const Color(0xFF009DFF),
        // ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        child: Text(
          label,
          // style: GoogleFonts.poppins(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w500,
          //   color: color,
          // )),
          style: AppTextStyle.body1SemiBold.copyWith(
            color: color,
          ),
        ));
  }
}

class ButtonOutlineWidget extends StatelessWidget {
  const ButtonOutlineWidget(
      {super.key, required this.label, required this.press, this.icon});

  final String label;
  final VoidCallback press;
  final Widget? icon;

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
                  icon!,
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
