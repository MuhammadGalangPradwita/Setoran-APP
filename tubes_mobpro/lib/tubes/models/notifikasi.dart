import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/pages/detail_activity_page.dart';
import 'package:tubes_mobpro/tubes/pages/edit_profile.dart';

enum Navigasi {
  none,
  transaksi,
  editProfile
}

class Notifikasi {
  final int idNotifikasi;
  final int idPengguna;
  final String judul;
  final String deskripsi;
  final Navigasi navigasi;
  final Map<String, dynamic>? dataNavigasi;
  final bool isSent;
  final bool isRead;

  Notifikasi({
    required this.idNotifikasi,
    required this.idPengguna,
    required this.judul,
    required this.deskripsi,
    required this.navigasi,
    this.dataNavigasi,
    required this.isSent,
    required this.isRead,
  });

  factory Notifikasi.fromJson(Map<String, dynamic> json) {
    return Notifikasi(
      idNotifikasi: json['id_notifikasi'] as int,
      idPengguna: json['id_pengguna'] as int,
      judul: json['judul'] as String,
      deskripsi: json['deskripsi'] as String,
      navigasi: _navigasiFromString(json['navigasi'] as String),
      dataNavigasi: json['data_navigasi'] as Map<String, dynamic>?,
      isSent: json['is_sent'] as bool,
      isRead: json['is_read'] as bool,
    );
  }

  static Navigasi _navigasiFromString(String value) {
    switch (value) {
      case 'transaksi':
        return Navigasi.transaksi;
      case 'editProfile':
        return Navigasi.editProfile;
      default:
        return Navigasi.none;
    }
  }

  /// kalau notif di klik bisa panggil ini
  void navigate(BuildContext context) {
    switch (navigasi) {
      case Navigasi.transaksi:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailActivityPage(activity: {},); // harus di benerin sesuai parameter activity
        }));
        break;
      case Navigasi.editProfile:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditProfilePage()
        ));
        break;
      default:
        // do nothing
        break;
    }
  }
}
