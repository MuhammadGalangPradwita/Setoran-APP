import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/image_view_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class EditIdCameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final Pengguna pengguna;
  const EditIdCameraPage(
      {super.key, required this.cameras, required this.pengguna});

  @override
  State<EditIdCameraPage> createState() => _EditIdCameraPageState();
}

class _EditIdCameraPageState extends State<EditIdCameraPage> {
  late CameraController controller;
  late XFile? imageFile;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max,
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
          title: const Text("Edit ID"),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                "Place your KTP in the box provided",
                style: AppTextStyle.body1Regular,
              ),
            ),
            Stack(alignment: Alignment.center, children: [
              CameraPreview(controller),
              AspectRatio(
                aspectRatio: 344 / 216,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: AppColors.B400.withOpacity(0.5),
                    width: 3,
                  )),
                ),
              )
            ]),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            _takePicture();
                          },
                          icon: const Icon(
                            Icons.camera,
                            size: 80,
                            color: AppColors.B400,
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              _flipCamera();
                            },
                            icon: const Icon(
                              Icons.flip_camera_android,
                              size: 50,
                              color: AppColors.B400,
                            )),
                      ],
                    )),
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
            builder: (context) => KTPImageViewPage(
              pengguna: widget.pengguna,
              imagePath: imageFile!.path,
            ),
          ));
    } catch (e) {
      print("Error taking picture: $e");
    }
  }

  void _flipCamera() async {
    if (widget.cameras.length > 1) {
      int newIndex = controller.description == widget.cameras[0] ? 1 : 0;
      controller.dispose();
      controller = CameraController(
        widget.cameras[newIndex],
        ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.nv21,
        enableAudio: false,
      );
      try {
        await controller.initialize();
        setState(() {});
      } catch (e) {
        print("Error switching camera: $e");
      }
    } else {
      print("No secondary camera available.");
    }
  }
}
