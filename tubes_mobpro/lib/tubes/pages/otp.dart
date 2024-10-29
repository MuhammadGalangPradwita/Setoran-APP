import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:tubes_mobpro/tubes/pages/create_new_pass.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String validPin = '1234'; // buat contoh

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      body: SafeArea(
          child: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Verify OTP",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Gap(24),
            Text(
              "Please enter 4 digit sent to your email",
              style: GoogleFonts.poppins(
                fontSize: 13,
              ),
            ),
            Gap(24),
            _pinInputForm(),
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "did not receive the code? ",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "resend",
                    style: GoogleFonts.poppins(
                        fontSize: 10, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  Widget _pinInputForm() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            Pinput(
              validator: (value) {
                return value == validPin ? null : "Pin is incorrect";
              },
              onCompleted: (pin) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return CreateNewPassPage();
                }));
              },
            ),
            Gap(24),
            SizedBox(
                width: 300,
                child: ButtonWidget.primary(
                    label: "Verify",
                    press: () {
                      formKey.currentState!.validate();
                    }))
          ],
        ));
  }
}
