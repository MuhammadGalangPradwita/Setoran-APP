class Motor {
  final int idMotor;
  final String platNomor;
  final int idMitra;
  final String nomorSTNK;
  final String nomorBPKB;
  final String model;
  final String brand;
  final String tipe;
  final int tahun;
  final String transmisi;
  final String statusMotor;
  final double hargaHarian;

  Motor({
    required this.idMotor,
    required this.platNomor,
    required this.idMitra,
    required this.nomorSTNK,
    required this.nomorBPKB,
    required this.model,
    required this.brand,
    required this.tipe,
    required this.tahun,
    required this.transmisi,
    required this.statusMotor,
    required this.hargaHarian,
  });

  factory Motor.fromJson(Map<String, dynamic> json) {
    return Motor(
      idMotor: json['id_motor'],
      platNomor: json['plat_nomor'],
      idMitra: json['id_mitra'],
      nomorSTNK: json['nomor_STNK'],
      nomorBPKB: json['nomor_BPKB'],
      model: json['model'],
      brand: json['brand'],
      tipe: json['tipe'],
      tahun: json['tahun'],
      transmisi: json['transmisi'],
      statusMotor: json['status_motor'],
      hargaHarian: double.parse(json['harga_harian'].toString()),
    );
  }
}
