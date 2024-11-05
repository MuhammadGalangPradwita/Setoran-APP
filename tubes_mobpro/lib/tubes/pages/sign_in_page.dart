import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/pages/forgot_password_email.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/pages/sign_up_page.dart';
import 'package:tubes_mobpro/tubes/widgets/google_login_dialog.dart';
import 'package:tubes_mobpro/tubes/widgets/bottom_nav.dart';

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
                createForm(context),
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
                      width: 160,
                      child: ButtonOutlineWidget(
                        label: "Google",
                        press: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return GoogleLoginDialogue();
                              });
                        },
                        icon: FaIcon(FontAwesomeIcons.google),
                      ),
                    ),
                    // Gap(64),
                    SizedBox(
                        width: 160,
                        child: ButtonOutlineWidget(
                          label: "Facebook",
                          press: () {},
                          icon: FaIcon(FontAwesomeIcons.facebook),
                        )),
                  ],
                ),
                const Gap(36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dont have account?"),
                    const Gap(4),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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

  Widget createForm(BuildContext context) {
    return Column(
      children: [
        const TextfieldWidget(
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your email",
          label: "Email",
        ),
        const Gap(24),
        const TextfieldWidget.password(
          hintText: "Enter your password",
          label: "Password",
        ),
        const Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ));
              },
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
            child: ButtonWidget.primary(
                label: "Login",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNav()));
                }))
      ],
    );
  }
}
