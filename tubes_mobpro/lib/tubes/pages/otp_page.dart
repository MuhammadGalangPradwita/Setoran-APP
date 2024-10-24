import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please enter 4 digit code sent to our phone number.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 32),
            PinCodeTextField(
              // controller: _otpController,
              appContext: context,
              length: 4,
              obscureText: true,
              obscuringCharacter: '*',
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.grey[300],
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.grey[100],
              ), onChanged: (String value) {  },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you don't receive he code try ",
                  style: TextStyle(color: Colors.black54),
                ),
                GestureDetector(
                  onTap: () {

                    // Navigate to sign up page
                  },
                  child: const Text(
                    'Signing Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle send email action
                  if (_emailController.text.isNotEmpty) {
                    // Implement email sending logic disini
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}