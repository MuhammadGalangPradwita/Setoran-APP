import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_mobpro/tubes/pages/sign_in_page.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/widgets/google_login_dialog.dart';

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
                createForm(context),
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
                      width: 160,
                      child: ButtonOutlineWidget(
                        label: "Google",
                        press: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const GoogleLoginDialogue();
                              });
                        },
                        icon: const FaIcon(FontAwesomeIcons.google),
                      ),
                    ),
                    // Gap(64),
                    SizedBox(
                        width: 160,
                        child: ButtonOutlineWidget(
                          label: "Facebook",
                          press: () {},
                          icon: const FaIcon(FontAwesomeIcons.facebook),
                        )),
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
                      child: Text("Sign In",
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

  Widget createForm(BuildContext context) {

    bool clicked = false;

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
            child: ButtonWidget.primary(label: "Register", press: () {
              // demo sementara snackbar
              if (!clicked) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password tidak sesuai')));
                clicked = true;
                return;
              }
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                headerAnimationLoop: false,
                animType: AnimType.bottomSlide,
                title: 'Sukses',
                desc: 'Akun berhasil dibuat, silahkan login',
                buttonsTextStyle: const TextStyle(color: Colors.black),
                showCloseIcon: false,
                // btnCancelOnPress: () {},
                btnOkOnPress: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInPage()));
                },
              ).show();
            })
        )
      ],
    );
  }
}
