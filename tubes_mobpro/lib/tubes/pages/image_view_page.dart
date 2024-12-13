// page untuk tes kamera

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet("1234567894561238");
    });
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

  void _showBottomSheet(String id) {
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
}
