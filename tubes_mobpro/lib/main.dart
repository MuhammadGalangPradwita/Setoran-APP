import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tubes_mobpro/tubes/camera_service.dart';
import 'package:tubes_mobpro/tubes/pages/get_started_page.dart';
import 'package:tubes_mobpro/notification_service.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_page.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  await CameraService.instance.initializeCameras();
  // debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestStoragePermission();
    requestCameraStatus();
  }

  void requestCameraStatus() async {
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
  }

  void requestStoragePermission() async {
    var photoStatus = await Permission.photos.status;
    if (!photoStatus.isGranted) {
      await Permission.photos.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetStartedPage(),
    );
  }
}


