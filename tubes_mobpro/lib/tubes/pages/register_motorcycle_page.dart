import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/pages/register_motorcycle_upload_photos_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/dropdownField_widget.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class RegisterMotorcyclePage extends StatefulWidget {
  const RegisterMotorcyclePage({super.key});

  @override
  State<RegisterMotorcyclePage> createState() => _RegisterMotorcyclePageState();
}

class _RegisterMotorcyclePageState extends State<RegisterMotorcyclePage> {
  final TextEditingController stnkNumberController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  final List<Map<String, String>> transmissionOptions = const [
    {"id": "manual", "display": "Manual"},
    {"id": "automatic", "display": "Automatic"},
  ];

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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextfieldWidget(
              label: "STNK Number",
              keyboardType: TextInputType.number,
            ),
            const Gap(16),
            TextfieldWidget(
              label: "Plate Number",
              keyboardType: TextInputType.number,
            ),
            const Gap(16),
            TextfieldWidget(
              label: "Brand",
            ),
            const Gap(16),
            TextfieldWidget(
              label: "Type",
            ),
            const Gap(16),
            TextfieldWidget(
              label: "Year",
              keyboardType: TextInputType.number,
            ),
            const Gap(16),
            DropdownMenuWidget(
                width: double.infinity,
                label: "Transmission",
                options: transmissionOptions,
                optionLabel: (option) => option["display"]!),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: ButtonWidget.primary(
                        label: "Continue",
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterMotorcycleUploadPhotosPage()));
                        }))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
