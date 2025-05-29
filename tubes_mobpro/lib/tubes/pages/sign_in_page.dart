import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/forgot_password_email.dart';
import 'package:tubes_mobpro/tubes/services/firebase_notification_service.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/pages/sign_up_page.dart';
import 'package:tubes_mobpro/tubes/widgets/google_login_dialog.dart';
import 'package:tubes_mobpro/tubes/widgets/bottom_nav.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                                builder: (context) => SignUpPage()));
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
              child: Text("Forgot Password?",
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
                  final api_instance = ApiService();

                  api_instance.setoranAPi
                      .loginPost(new LoginRequest(
                          email: _email.text, password: _password.text))
                      .then((response) async {
                    if (response?.accessToken != null) {
                      api_instance.setToken(response!.accessToken!);
                      Provider.of<AuthState>(context, listen: false)
                          .refreshCurrentUser(); // refresh currentUser
                      await FirebaseNotificationService()
                          .getToken(); // register device token setelah login berhasil
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNav(),
                          ));
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        headerAnimationLoop: false,
                        animType: AnimType.bottomSlide,
                        title: 'Gagal',
                        desc:
                            'Login Gagal, (klik ok untuk menggunakan dummy account)',
                        buttonsTextStyle: const TextStyle(color: Colors.black),
                        showCloseIcon: false,
                        btnOkOnPress: () {
                          AuthState.dummy = Pengguna(
                              id: "123",
                              nama: "Akbar Faisal",
                              email: "akbarfaisal@email.com");
                          Provider.of<AuthState>(context, listen: false)
                              .refreshCurrentUser(); // refresh currentUser
                        },
                        btnCancelOnPress: () {},
                      ).show();
                    }
                  });
                }))
      ],
    );
  }
}
