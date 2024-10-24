import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/pages/sign_in_page.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const Gap(36),
                createForm(),
                const Gap(36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.grey,
                      height: 2,
                      margin: const EdgeInsets.only(right: 10),
                    )),
                    const Text("Or sign in with"),
                    Expanded(
                        child: Container(
                      color: Colors.grey,
                      height: 2,
                      margin: const EdgeInsets.only(left: 10),
                    )),
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
                        icon: Container(
                          width: 16,
                          height: 16,
                          child: Image(image: AssetImage('assets/images/google_icon.png')),
                        ),
                      ),
                    ),
                    // Gap(64),
                    SizedBox(
                        width: 144,
                        child:
                            ButtonOutlineWidget(label: "Google", press: () {},)),
                  ],
                ),
                const Gap(36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const Gap(4),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      },
                      child: InkWell(
                        child: Text("Sign In",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            )),
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

  Widget createForm() {
    return Column(
      children: [
        const TextfieldWidget(
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your username",
          label: "Email",
        ),
        const Gap(24),
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
        const Gap(24),
        // const TextfieldWidget(
        //   keyboardType: TextInputType.visiblePassword,
        //   hintText: "Confirm your password",
        //   label: "Password",
        //   obscureText: true,
        //   suffixIcon: Icon(Icons.visibility_off),
        // ),
        const TextfieldWidget.password(
          hintText: "Confirm your password",
          label: "Password",
        ),
        const Gap(32),
        SizedBox(
            width: double.infinity,
            child: ButtonWidget.primary(label: "Register", press: () {}))
      ],
    );
  }
}
