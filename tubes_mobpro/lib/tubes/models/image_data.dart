import 'dart:typed_data';

import 'package:tubes_mobpro/tubes/models/pelanggan.dart';

class ImageData {
  final int id;
  final Uint8List? data;

  ImageData({required this.id, this.data});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(id: json["id_gambar"], data: json["data"] as Uint8List);
  }
}
