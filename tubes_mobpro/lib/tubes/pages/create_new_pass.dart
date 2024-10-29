import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/pages/sign_in_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class CreateNewPassPage extends StatefulWidget {
  CreateNewPassPage({super.key});

  @override
  State<CreateNewPassPage> createState() => _CreateNewPassPageState();
}

class _CreateNewPassPageState extends State<CreateNewPassPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create New Password",
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Gap(12),
            Text(
              "New password must be different from previous password.",
              style: GoogleFonts.poppins(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            _form()
          ],
        ),
      )),
    );
  }

  Widget _form() {
    String _firstPass = '';
    return Form(
        key: formKey,
        child: Column(
          children: [
            TextfieldWidget.password(
              hintText: "Enter your new password",
              label: "New Password",
              validator: (value) {
                if (value!.isEmpty || value.length < 8) {
                  return "Password must have more than 8 characters";
                } else {
                  _firstPass = value;
                  return null;
                }
              },
            ),
            const Gap(16),
            TextfieldWidget.password(
              hintText: "Enter your new password",
              label: "Confirm Password",
              validator: (value) {
                if (value != _firstPass) {
                  return "Please Match yout password";
                } else {
                  return null;
                }
              },
            ),
            const Gap(16),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget.primary(
                  label: "Reset Password",
                  press: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    }
                  }),
            )
          ],
        ));
  }
}
