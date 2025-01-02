import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tubes_mobpro/tubes/pages/image_view_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class EditDrivingLicenseCameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const EditDrivingLicenseCameraPage({super.key, required this.cameras});

  @override
  State<EditDrivingLicenseCameraPage> createState() =>
      _EditDrivingLicenseCameraPageState();
}

class _EditDrivingLicenseCameraPageState
    extends State<EditDrivingLicenseCameraPage> {
  late CameraController controller;
  late XFile? imageFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[1], ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.nv21, enableAudio: false);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) async {
      if (e is CameraException) {
        if (e.code == 'CameraAccessDenied') {
          await Permission.camera.request();
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: AppColors.N0,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Edit Driver License"),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Place your Driver License in the box provided",
                style: AppTextStyle.body1Regular,
              ),
            ),
            Stack(alignment: Alignment.center, children: [
              CameraPreview(controller),
              Container(
                width: 344,
                height: 216,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: AppColors.B400,
                  width: 3,
                )),
              )
            ]),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          _takePicture();
                        },
                        icon: const Icon(
                          Icons.camera,
                          size: 80,
                          color: AppColors.B400,
                        ))
                  ],
                )
              ],
            ))
          ],
        ),
      );
    }
  }

  void _takePicture() async {
    try {
      final XFile picture = await controller.takePicture();
      setState(() {
        imageFile = picture;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageViewPage(
              imagePath: imageFile!.path,
            ),
          ));
    } catch (e) {
      print("Error taking picture: $e");
    }
  }
}
