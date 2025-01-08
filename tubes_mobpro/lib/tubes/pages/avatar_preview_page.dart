import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class AvatarPreviewPage extends StatefulWidget {
  final Image image;
  const AvatarPreviewPage({super.key, required this.image});

  @override
  State<AvatarPreviewPage> createState() => _AvatarPreviewPageState();
}

class _AvatarPreviewPageState extends State<AvatarPreviewPage> {
  late Image newImage;

  @override
  void initState() {
    super.initState();
    newImage = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        title: const Text("Profil Picture"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
        onPressed: () {
          _pickImage();
        },
        child: const Icon(Icons.edit),
      ),
      body: Center(
        child: Image(
          image: newImage.image,
        ),
      ),
    );
  }

  Future _pickImage() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    String path = returnedImage!.path;
    Image image = Image.file(File(path));
    setState(() {
      newImage = image;
    });
  }
}
