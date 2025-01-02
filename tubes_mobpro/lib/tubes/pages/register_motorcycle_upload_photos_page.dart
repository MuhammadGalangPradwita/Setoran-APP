import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class RegisterMotorcycleUploadPhotosPage extends StatefulWidget {
  const RegisterMotorcycleUploadPhotosPage({super.key});

  @override
  State<RegisterMotorcycleUploadPhotosPage> createState() =>
      _RegisterMotorcycleUploadPhotosPageState();
}

class _RegisterMotorcycleUploadPhotosPageState
    extends State<RegisterMotorcycleUploadPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Register Motorcycle"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: SingleChildScrollView(
        // width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Upload Photos",
                  style: AppTextStyle.body1Bold,
                ),
                const Gap(16),
                Text(
                  "upload your motorcycle photo from 4 different side",
                  style: AppTextStyle.body2Regular,
                )
              ],
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Front View",
                  style: AppTextStyle.body1SemiBold,
                ),
                const Gap(12),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.N400),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.N400,
                          size: 32,
                        ),
                        const Gap(6),
                        Text(
                          "upload",
                          style: AppTextStyle.body2Regular
                              .copyWith(color: AppColors.N400),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Left View",
                  style: AppTextStyle.body1SemiBold,
                ),
                const Gap(12),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.N400),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.N400,
                          size: 32,
                        ),
                        const Gap(6),
                        Text(
                          "upload",
                          style: AppTextStyle.body2Regular
                              .copyWith(color: AppColors.N400),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Right View",
                  style: AppTextStyle.body1SemiBold,
                ),
                const Gap(12),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.N400),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.N400,
                          size: 32,
                        ),
                        const Gap(6),
                        Text(
                          "upload",
                          style: AppTextStyle.body2Regular
                              .copyWith(color: AppColors.N400),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rear View",
                  style: AppTextStyle.body1SemiBold,
                ),
                const Gap(12),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.N400),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.file_upload_outlined,
                          color: AppColors.N400,
                          size: 32,
                        ),
                        const Gap(6),
                        Text(
                          "upload",
                          style: AppTextStyle.body2Regular
                              .copyWith(color: AppColors.N400),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Gap(20),
            SizedBox(
              width: double.infinity,
              child: ButtonWidget.primary(
                  label: "Register",
                  press: () {
                    _showConfirmDialog(context);
                  }),
            )
          ],
        ),
      ),
    );
  }

  _showConfirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.N0,
          title: Text(
            "Confirm your data",
            style: AppTextStyle.h3Bold,
          ),
          content: Text(
            "By submitting this form, I certify that the information provided is accurate and complete to the best of my knowledge",
            style: AppTextStyle.body1Regular,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                    child: ButtonWidget.secondary(
                        label: "Cancel",
                        press: () {
                          Navigator.pop(context);
                        })),
                const Gap(8),
                Expanded(
                    child: ButtonWidget.primary(label: "Confirm", press: () {}))
              ],
            )
          ],
        );
      },
    );
  }
}
