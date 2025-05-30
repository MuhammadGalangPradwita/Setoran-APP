import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
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
  final TextEditingController bpkbNumberController = TextEditingController();
  final TextEditingController plateNumberController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  String? selectedTransmission;

  @override
  void initState() {
    _pupulateControllers();
    super.initState();
  }

  void _pupulateControllers() {
    // only use for testing, will be removed later
    stnkNumberController.text = "123456789";
    bpkbNumberController.text = "M12345678";
    plateNumberController.text = "A1234BC";
    modelController.text = "Mio";
    brandController.text = "Yamaha";
    typeController.text = "Scooter";
    yearController.text = "2022";
    hargaController.text = "65000";
  }

  final List<Map<String, String>> transmissionOptions = const [
    {"id": "manual", "display": "Manual"},
    {"id": "matic", "display": "Matic"},
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextfieldWidget(
                label: "STNK Number",
                keyboardType: TextInputType.number,
                controller: stnkNumberController,
              ),
              const Gap(16),
              TextfieldWidget(
                label: "BPKB Number",
                keyboardType: TextInputType.text,
                controller: bpkbNumberController,
              ),
              const Gap(16),
              TextfieldWidget(
                label: "Plate Number",
                keyboardType: TextInputType.text,
                controller: plateNumberController,
              ),
              const Gap(16),
              TextfieldWidget(
                label: "Model",
                controller: modelController,
              ),
              const Gap(16),
              TextfieldWidget(
                label: "Brand",
                controller: brandController,
              ),
              const Gap(16),
              TextfieldWidget(
                label: "Type",
                controller: typeController,
              ),
              const Gap(16),
              TextfieldWidget(
                label: "Year",
                keyboardType: TextInputType.number,
                controller: yearController,
              ),
              const Gap(16),
              DropdownMenuWidget<Map<String, String>>(
                width: double.infinity,
                label: "Transmission",
                options: transmissionOptions,
                optionLabel: (option) => option["display"]!,
                onChanged: (option) {
                  setState(() {
                    selectedTransmission = option?["id"];
                  });
                },
              ),
              const Gap(16),
              TextfieldWidget(
                label: "Proposed Daily Price",
                keyboardType: TextInputType.number,
                controller: hargaController,
              ),
              const Gap(48),
              SizedBox(
                  width: double.infinity,
                  child: ButtonWidget.primary(
                      label: "Continue",
                      press: () {
                        if (stnkNumberController.text.isEmpty ||
                            plateNumberController.text.isEmpty ||
                            bpkbNumberController.text.isEmpty ||
                            modelController.text.isEmpty ||
                            brandController.text.isEmpty ||
                            typeController.text.isEmpty ||
                            yearController.text.isEmpty ||
                            selectedTransmission!.isEmpty ||
                            hargaController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all fields"),
                              backgroundColor: AppColors.R400,
                            ),
                          );
                          return;
                        }
                        MotorForm motorcycle = MotorForm(
                          idMitra:
                              Provider.of<AuthState>(context, listen: false)
                                  .currentUser!
                                  .mitra!
                                  .idMitra!,
                          platNomor: plateNumberController.text,
                          nomorSTNK: stnkNumberController.text,
                          nomorBPKB: bpkbNumberController.text,
                          model: modelController.text,
                          brand: brandController.text,
                          tipe: typeController.text,
                          tahun: int.parse(yearController.text),
                          transmisi: selectedTransmission!,
                          statusMotor: "Diajukan",
                          hargaHarian: double.parse(hargaController.text),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegisterMotorcycleUploadPhotosPage(
                                      motorForm: motorcycle,
                                    )));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
