// page untuk tes kamera

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class KTPImageViewPage extends StatefulWidget {
  final String imagePath;
  final Pengguna pengguna;
  const KTPImageViewPage(
      {super.key, required this.imagePath, required this.pengguna});

  @override
  State<KTPImageViewPage> createState() => _KTPImageViewPageState();
}

class _KTPImageViewPageState extends State<KTPImageViewPage> {
  late String recognizedText;
  final TextEditingController controller = TextEditingController();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        recognizedText =
            await _extractText(File(widget.imagePath)) ?? "1234567894561238";
        // _showBottomSheet("1234567894561238");
        _showBottomSheet(recognizedText);
      } catch (e) {
        print('Error processing image: $e');
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Captured Image"),
      ),
      body: Center(
        child: Image.file(File(widget.imagePath)),
      ),
    );
  }

  _showBottomSheet(String id) async {
    controller.text = id;

    showModalBottomSheet(
      backgroundColor: AppColors.N0,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Text(
                "Please confirm that the ID number shown is correct",
                style: AppTextStyle.body1Regular,
              ),
              const Gap(16),
              TextfieldWidget(
                readOnly: false,
                keyboardType: TextInputType.number,
                label: "ID No",
                controller: controller,
              ),
              const Gap(16),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style:
                      AppTextStyle.body3Regular.copyWith(color: AppColors.R400),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget.secondary(
                              label: "Cancel",
                              press: () {
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              }),
                        ),
                        const Gap(16),
                        Expanded(
                            child: ButtonWidget.primary(
                                label: "Confirm",
                                press: () {
                                  if (controller.text.isNotEmpty &&
                                      controller.text.length == 16) {
                                    _saveId();
                                  } else {
                                    setState(() {
                                      errorMessage =
                                          "Please enter a valid ID number (16 digits).";
                                    });
                                  }
                                }))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _saveId() async {
    if (controller.text.isNotEmpty && controller.text.length == 16) {
      widget.pengguna.nomorKTP = controller.text;
      await ApiService().penggunaApi.penggunaPut(
          postPenggunaDTO: PostPenggunaDTO(
              id: widget.pengguna.id!, nomorKTP: widget.pengguna.nomorKTP));
      AwesomeDialog(
        dialogBackgroundColor: AppColors.N0,
        context: context,
        dialogType: DialogType.success,
        title: 'Success',
        desc: 'ID number has been saved successfully.',
        btnOkOnPress: () {
          Navigator.of(context)
            ..pop()
            ..pop()
            ..pop()
            ..pop();
        },
      ).show();
    }
  }

  Future<String?> _extractText(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    try {
      final InputImage inputImage = InputImage.fromFile(file);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      String text = recognizedText.text;
      List<String> splitText = text.split('\n');
      for (String s in splitText) {
        print(s);
      }
      return extractNIK(splitText);
    } catch (e) {
      print('Error extracting text: $e');
      return null;
    } finally {
      await textRecognizer.close();
    }
  }

  String extractNIK(List<String> texts) {
    final exp = RegExp(r'\b\d{14,}\b');
    for (var text in texts) {
      text = text
          .replaceAll('i', '1')
          .replaceAll('l', '1')
          .replaceAll('B', '3')
          .replaceAll('?', '2');
      print('edited: ' + text);
      final match = exp.firstMatch(text);
      if (match != null) {
        return match.group(0)!;
      }
    }
    return '';
  }
}

class SIMImageViewPage extends StatefulWidget {
  final String imagePath;
  final Pelanggan pelanggan;
  const SIMImageViewPage(
      {super.key, required this.imagePath, required this.pelanggan});

  @override
  State<SIMImageViewPage> createState() => _SIMImageViewPageState();
}

class _SIMImageViewPageState extends State<SIMImageViewPage> {
  late String recognizedText;
  final TextEditingController controller = TextEditingController();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        recognizedText =
            await _extractText(File(widget.imagePath)) ?? "1234567894561238";
        // _showBottomSheet("1234567894561238");
        _showBottomSheet(recognizedText);
      } catch (e) {
        print('Error processing image: $e');
        Navigator.of(context).pop();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Captured Image"),
      ),
      body: Center(
        child: Image.file(File(widget.imagePath)),
      ),
    );
  }

  _showBottomSheet(String number) async {
    controller.text = number;

    showModalBottomSheet(
      backgroundColor: AppColors.N0,
      isDismissible: false,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Text(
                "Please confirm that the Driver License number shown is correct",
                style: AppTextStyle.body1Regular,
              ),
              const Gap(16),
              TextfieldWidget(
                readOnly: false,
                keyboardType: TextInputType.number,
                label: "Driver License No.",
                controller: controller,
              ),
              const Gap(16),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style:
                      AppTextStyle.body3Regular.copyWith(color: AppColors.R400),
                ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget.secondary(
                              label: "Cancel",
                              press: () {
                                Navigator.of(context)
                                  ..pop()
                                  ..pop();
                              }),
                        ),
                        const Gap(16),
                        Expanded(
                            child: ButtonWidget.primary(
                                label: "Confirm",
                                press: () {
                                  if (controller.text.isNotEmpty &&
                                      controller.text.length == 16) {
                                    _saveId(context);
                                  } else {
                                    setState(() {
                                      errorMessage =
                                          "Please enter a valid Driver License number (16 digits).";
                                    });
                                  }
                                }))
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _saveId(BuildContext context) async {
    // save id to database
    if (controller.text.isNotEmpty) {
      widget.pelanggan.nomorSIM = controller.text;
      // await PelangganApi.updatePelanggan(widget.pelanggan);
      await ApiService().pelangganApi.pelangganPut(
          postPelangganDTO: PostPelangganDTO(
              idPelanggan: widget.pelanggan.idPelanggan!,
              nomorSIM: widget.pelanggan.nomorSIM!));
      AwesomeDialog(
        dialogBackgroundColor: AppColors.N0,
        context: context,
        dialogType: DialogType.success,
        title: 'Success',
        desc: 'Driver License number has been saved successfully.',
        btnOkOnPress: () {
          Navigator.of(context)
            ..pop()
            ..pop()
            ..pop();
        },
      ).show();
    }
  }

  Future<String?> _extractText(File file) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    try {
      final InputImage inputImage = InputImage.fromFile(file);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      String text = recognizedText.text;
      List<String> splitText = text.split('\n');
      for (String s in splitText) {
        print(s);
      }
      return extractNumber(splitText);
    } catch (e) {
      print('Error extracting text: $e');
      return null;
    } finally {
      await textRecognizer.close();
    }
  }

  String extractNumber(List<String> texts) {
    final exp = RegExp(r'\b\d{10,}\b');
    for (var text in texts) {
      text = text
          .replaceAll('i', '1')
          .replaceAll('l', '1')
          .replaceAll('B', '3')
          .replaceAll('?', '2');
      print('edited: ' + text);
      final match = exp.firstMatch(text);
      if (match != null) {
        return match.group(0)!;
      }
    }
    return '';
  }
}
