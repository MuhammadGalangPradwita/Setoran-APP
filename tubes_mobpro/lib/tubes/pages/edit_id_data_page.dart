import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/camera_service.dart';
import 'package:tubes_mobpro/tubes/pages/edit_id_camera_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class EditIDDataPage extends StatefulWidget {
  const EditIDDataPage({super.key});

  @override
  State<EditIDDataPage> createState() => _EditIDDataPageState();
}

class _EditIDDataPageState extends State<EditIDDataPage> {
  TextEditingController _type = TextEditingController();
  TextEditingController _no = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _type.text = "KTP";
    _no.text = "1234567894561238";
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
        title: const Text("Edit ID"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextfieldWidget(
              readOnly: true,
              label: "Type",
              controller: _type,
            ),
            const Gap(16),
            TextfieldWidget(
              readOnly: true,
              label: "ID No",
              controller: _no,
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
