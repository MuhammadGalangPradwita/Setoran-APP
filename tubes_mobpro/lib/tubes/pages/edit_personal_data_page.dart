import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/dropdownField_widget.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class EditPersonalDataPage extends StatefulWidget {
  const EditPersonalDataPage({super.key});

  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  List<Map<String, String>> genderOptions = [
    {"id": "male", "display": "Male"},
    {"id": "female", "display": "Female"},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: "Akbar Faisal");
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
        title: const Text("Edit Personal Data"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextfieldWidget(
                    controller: _nameController,
                    label: "Name",
                    hintText: "Name",
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Birthdate",
                    hintText: 'Your Birthdate',
                  ),
                  const Gap(16),
                  DropdownMenuWidget(
                    width: double.infinity,
                    label: "Gender",
                    options: genderOptions,
                    optionLabel: (option) => option["display"]!,
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Address",
                    maxLines: 5,
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Phone Number",
                    keyboardType: TextInputType.number,
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonWidget.primary(
                              label: "Save Changes", press: () {}))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
