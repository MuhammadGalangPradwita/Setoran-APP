import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/sign_in_page.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

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
    return Column(
      children: [
        TextfieldWidget(
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your username",
          label: "Username",
          controller: _username,
        ),
        const Gap(24),
        TextfieldWidget(
          keyboardType: TextInputType.emailAddress,
          hintText: "Enter your email",
          label: "Email",
          controller: _email,
        ),
        const Gap(24),
        TextfieldWidget.password(
          hintText: "Enter your password",
          label: "Password",
          controller: _password,
        ),
        const Gap(24),
        TextfieldWidget.password(
          hintText: "Confirm your password",
          label: "Password",
          controller: _confirmPassword,
        ),
        const Gap(32),
        SizedBox(
            width: double.infinity,
            child: ButtonWidget.primary(
                label: "Register",
                press: () {
                  // demo sementara snackbar
                  if (_password.text != _confirmPassword.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password tidak sesuai')));
                    return;
                  }

                  // AuthApi.register(_username.text, _email.text, _password.text)
                  ApiService()
                      .authApi
                      .authRegisterPostWithHttpInfo(
                          registerForm: RegisterForm(
                              nama: _username.text,
                              email: _email.text,
                              password: _password.text))
                      .then((response) {
                    if (response.statusCode == 200) {
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
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Gagal',
                        desc: 'Akun gagal dibuat',
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: false,
                        // btnCancelOnPress: () {},
                        btnCancelOnPress: () {},
                      ).show();
                    }
                  });
                }))
      ],
    );
  }
}
