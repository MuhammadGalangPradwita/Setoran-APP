import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:http/http.dart' as http;

class AvatarPreviewPage extends StatefulWidget {
  final Image image;
  const AvatarPreviewPage({super.key, required this.image});

  @override
  State<AvatarPreviewPage> createState() => _AvatarPreviewPageState();
}

class _AvatarPreviewPageState extends State<AvatarPreviewPage> {
  late Image newImage;
  late XFile? returnedImage;
  bool _isLoading = false;

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
      body: Stack(children: [
        Center(
          child: Image(
            image: newImage.image,
          ),
        ),
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.5),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ]),
    );
  }

  Future _pickImage() async {
    setState(() {
      _isLoading = true;
    });
    try {
      returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage == null) {
        return;
      }
      final file = http.MultipartFile.fromBytes(
          'file', await returnedImage!.readAsBytes(),
          filename: returnedImage!.name,
          contentType: MediaType('image', 'jpeg'));
      final response =
          await ApiService().storageApi.storageStorePost(file: file);
      if (response != null) {
        await ApiService().penggunaApi.penggunaPut(
            postPenggunaDTO: PostPenggunaDTO(
                id: Provider.of<AuthState>(context, listen: false)
                    .currentUser!
                    .id!,
                idGambar: response));
        String path = returnedImage!.path;
        Image image = Image.file(File(path));
        setState(() {
          newImage = image;
        });
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
