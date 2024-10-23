import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(64),
                Text(
                  "Sign In",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Gap(36),
                createForm(),
                const Gap(36),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Or sign in with"),
                  ],
                ),
                const Gap(36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 144,
                      child: ButtonOutlineWidget(
                        label: "Google",
                        press: () {},
                        icon: Icons.map,
                      ),
                    ),
                    // Gap(64),
                    SizedBox(
                        width: 144,
                        child:
                            ButtonOutlineWidget(label: "Google", press: () {})),
                  ],
                ),
                const Gap(36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont hace account?"),
                    const Gap(4),
                    InkWell(
                      onTap: () {},
                      child: Text("Sign Up",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createForm() {
    return Column(
      children: [
        const TextfieldWidget(
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your email",
          label: "Email",
        ),
        const Gap(24),
        const TextfieldWidget(
          keyboardType: TextInputType.visiblePassword,
          hintText: "Enter your password",
          label: "Password",
          obscureText: true,
          suffixIcon: Icon(Icons.visibility_off),
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: Text("Fortgot Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ],
        ),
        const Gap(16),
        SizedBox(
            width: double.infinity,
            child: ButtonWidget.primary(label: "Login", press: () {}))
      ],
    );
  }
}
