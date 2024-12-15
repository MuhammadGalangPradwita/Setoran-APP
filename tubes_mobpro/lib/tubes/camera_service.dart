//kelas singleton, tinggal panggil instance
import 'package:camera/camera.dart';

class CameraService {
  static final CameraService _instance = CameraService._internal();

  List<CameraDescription> _cameras = [];

  CameraService._internal();

  static CameraService get instance => _instance;

  Future<void> initializeCameras() async {
    try {
      if (_cameras.isEmpty) {
        _cameras = await availableCameras();
      }
    } on CameraException catch (e) {
      print('Gagal inisialisasi kamera: $e');
    }
  }

  List<CameraDescription> get cameras => _cameras;
}
