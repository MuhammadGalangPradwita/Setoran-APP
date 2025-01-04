import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/api_utilities/notifApi.dart';
import 'package:tubes_mobpro/tubes/api_utilities/transaksi.dart';
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
  bool isSent;
  bool isRead;

  final DateTime createdAt;

  Notifikasi({
    required this.idNotifikasi,
    required this.idPengguna,
    required this.judul,
    required this.deskripsi,
    required this.navigasi,
    this.dataNavigasi,
    required this.isSent,
    required this.isRead,
    required this.createdAt
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
      createdAt: DateTime.parse(json["created_at"]),
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
  void onClick(BuildContext context) {
    // mark as read, uncomment setelah testing
    // NotifApi.read(idNotifikasi);

    switch (navigasi) {
      case Navigasi.transaksi:

        if (dataNavigasi == null || !dataNavigasi!.containsKey("id_transaksi"))
          return;

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FutureBuilder(
            future: TransaksiApi.getTransaksi(dataNavigasi!["id_transaksi"]), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Transaction not found'));
              } else {
                if (snapshot.data == null)
                  return Center(child: Text('Error: transaction with id ${dataNavigasi!["id_transaksi"]} not found'));
                return DetailActivityPage(transaksi: snapshot.data!,);
              }
            });
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
