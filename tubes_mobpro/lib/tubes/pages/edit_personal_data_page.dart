import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class EditPersonalDataPage extends StatefulWidget {
  final Pengguna pengguna;
  const EditPersonalDataPage({super.key, required this.pengguna});

  @override
  State<EditPersonalDataPage> createState() => _EditPersonalDataPageState();
}

class _EditPersonalDataPageState extends State<EditPersonalDataPage> {
  final _formKey = GlobalKey<FormState>();
  // Pengguna? pengguna;
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
    _mapController();
    // loadPengguna();
  }

  Future<void> loadPengguna() async {
    // final result = await PenggunaApi().penggunaCurrentPenggunaGetWithHttpInfo();
    setState(() {
      // pengguna = result;
      _mapController();
    });
  }

  _mapController() {
    _nameController.text = widget.pengguna.nama ?? "";
    _addressController.text = widget.pengguna.alamat ?? "";
    _phoneController.text = widget.pengguna.nomorTelepon ?? "";
    _emailController.text = widget.pengguna.email ?? "";
    _dateController.text = AppUtil.formatDate(widget.pengguna.tanggalLahir!);
    _selectedDate = widget.pengguna.tanggalLahir!;
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
    if (widget.pengguna == null) {
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextfieldWidget(
                        label: "Birthdate",
                        hintText: 'Your Birthdate',
                        controller: _dateController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your birthdate';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Address",
                    maxLines: 5,
                    controller: _addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Phone Number",
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const Gap(16),
                  TextfieldWidget(
                    label: "Email",
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const Gap(24),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonWidget.primary(
                              label: "Save Changes",
                              press: () {
                                _saveChanges(context);
                              }))
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  void _saveChanges(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      widget.pengguna.nama = _nameController.text;
      widget.pengguna.alamat = _addressController.text;
      widget.pengguna.nomorTelepon = _phoneController.text;
      widget.pengguna.email = _emailController.text;
      final inputFormatter = DateFormat('dd MMMM yyyy');
      final outputFormatter = DateFormat('yyyy-MM-dd');
      final date = inputFormatter.parse(_dateController.text);
      final formatted = outputFormatter.format(date);
      widget.pengguna.tanggalLahir = DateTime.parse(formatted);

      // TODO: call API to update pengguna
      // await PenggunaApi.updatePengguna(widget.pengguna);
      // await PenggunaApi().
      Navigator.of(context).pop();
    }
  }
}
