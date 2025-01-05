import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_utilities/pengguna.dart';
import 'package:tubes_mobpro/tubes/models/pelanggan.dart';
import 'package:tubes_mobpro/tubes/models/pengguna.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';
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
  Pengguna? pengguna;
  DateTime? _selectedDate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  List<Map<String, String>> genderOptions = [
    {"id": "male", "display": "Male"},
    {"id": "female", "display": "Female"},
  ];

  @override
  void initState() {
    super.initState();
    loadPengguna();
  }

  Future<void> loadPengguna() async {
    final result = await PenggunaApi.getCurrentUser();
    setState(() {
      pengguna = result;
      _mapController();
    });
  }

  _mapController() {
    _nameController.text = pengguna!.nama;
    _addressController.text = pengguna!.alamat ?? "";
    _phoneController.text = pengguna!.nomorTelepon ?? "";
    _emailController.text = pengguna!.email;
    _dateController.text =
        AppUtil.formatDateFromString(pengguna!.tanggalLahir!);
    _selectedDate = DateTime.parse(pengguna!.tanggalLahir!);
  }

  Future<void> _selectDate(BuildContext context) async {
    final date = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(date.year - 80),
      lastDate: DateTime(date.year - 17),
      initialDate: _selectedDate ?? date,
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = AppUtil.formatDate(picked);
        print("___${_dateController.text}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (pengguna == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // _mapController();
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
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextfieldWidget(
                        label: "Birthdate",
                        hintText: 'Your Birthdate',
                        controller: _dateController,
                      ),
                    ),
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
                    controller: _addressController,
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Phone Number",
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
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
