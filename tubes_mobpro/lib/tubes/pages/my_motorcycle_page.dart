import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/pages/register_motorcycle_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class MyMotorcyclePage extends StatefulWidget {
  final bool isRegistered;
  const MyMotorcyclePage({super.key, required this.isRegistered});

  @override
  State<MyMotorcyclePage> createState() => _MyMotorcyclePageState();
}

class _MyMotorcyclePageState extends State<MyMotorcyclePage> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isRegistered) {
      return Scaffold(
        backgroundColor: AppColors.N0,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("My Motorcycle"),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "It appears you haven't registered yet. Register your motorcycle now to become our partner",
                  style: AppTextStyle.body1Regular.copyWith(),
                  textAlign: TextAlign.center,
                ),
                const Gap(16),
                SizedBox(
                  width: 128,
                  child: ButtonWidget.primary(
                    label: 'Register',
                    press: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           const RegisterMotorcyclePage(),
                      //     ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterMotorcyclePage(),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Center();
    }
  }
}
