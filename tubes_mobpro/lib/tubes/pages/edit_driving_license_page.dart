import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/camera_service.dart';
import 'package:tubes_mobpro/tubes/pages/edit_id_camera_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class EditDrivingLicensePage extends StatefulWidget {
  const EditDrivingLicensePage({super.key});

  @override
  State<EditDrivingLicensePage> createState() => _EditDrivingLicensePageState();
}

class _EditDrivingLicensePageState extends State<EditDrivingLicensePage> {
  final TextEditingController _status = TextEditingController();
  final TextEditingController _no = TextEditingController();

  @override
  void initState() {
    super.initState();
    _status.text = "valid";
    _no.text = "1328-0112-000039";
  }

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
        title: const Text("Edit Driving License"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextfieldWidget(
              readOnly: true,
              label: "Status",
              controller: _status,
            ),
            const Gap(16),
            TextfieldWidget(
              readOnly: true,
              label: "No",
              controller: _no,
            ),
            const Gap(16),
            Text(
              "Are you sure you want to change your Driving License Number ?",
              style: AppTextStyle.body2Regular,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: ButtonWidget.primary(
                            label: "Continue",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditIdCameraPage(
                                        cameras:
                                            CameraService.instance.cameras),
                                  ));
                            })),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
