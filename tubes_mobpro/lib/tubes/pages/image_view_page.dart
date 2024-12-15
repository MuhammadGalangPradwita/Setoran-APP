// page untuk tes kamera

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class ImageViewPage extends StatefulWidget {
  final String imagePath;
  const ImageViewPage({super.key, required this.imagePath});

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  late String recognizedText;

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
    TextEditingController controller = TextEditingController();
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
                readOnly: true,
                label: "ID No",
                controller: controller,
              ),
              const Gap(16),
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
                                label: "Confirm", press: () {}))
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
    final exp = RegExp(r'\b\d{16}\b');
    for (var text in texts) {
      text =
          text.replaceAll('i', '1').replaceAll('l', '1').replaceAll('B', '3');
      print(text);
      final match = exp.firstMatch(text);
      if (match != null) {
        return match.group(0)!;
      }
    }
    return '';
  }
}