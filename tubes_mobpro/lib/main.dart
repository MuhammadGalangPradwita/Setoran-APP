import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/camera_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:localstorage/localstorage.dart';

import 'tubes/services/firebase_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseNotificationService().initialize();
  await initLocalStorage();
  await CameraService.instance.initializeCameras();
  // await FirebaseNotificationService().getToken();
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
    // requestStoragePermission();
    requestCameraStatus();
    FirebaseNotificationService().getToken();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthState(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthCheck(),
      ),
    );
  }
}
