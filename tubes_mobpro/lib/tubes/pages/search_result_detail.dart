import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/motor_book_page.dart';
import 'package:tubes_mobpro/tubes/services/firebase_notification_service.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class SearchResultDetail extends StatefulWidget {
  final Motor motor;
  final DateTimeRange? selectedDateRange;

  SearchResultDetail({super.key, required this.motor, this.selectedDateRange});

  @override
  State<SearchResultDetail> createState() => _SearchResultDetailState();
}

class _SearchResultDetailState extends State<SearchResultDetail> {
  final formatter = NumberFormat("#,###");
  double? rating;

  @override
  void initState() {
    super.initState();

    getRatingFromUlasan();
  }

  Future<void> showUlasanDialog(BuildContext context) async {
    int rating = 0;
    final TextEditingController reviewController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    int? userId = (await ApiService().penggunaApi.penggunaCurrentPenggunaGet())!
        .pelanggan
        ?.idPelanggan;

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("ID user tidak terdeteksi."),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        ApiService().ulasanApi.apiUlasanGet().then(
              (value) {},
            );
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text("Beri Ulasan"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < rating
                                ? CupertinoIcons.star_fill
                                : Icons.star_border,
                            color: Colors.amber,
                          ),
                          onPressed: () {
                            setState(() {
                              rating = index + 1;
                            });
                          },
                        );
                      }),
                    );
                  },
                ),

                // Review TextField
                SizedBox(height: 16),
                TextFormField(
                  controller: reviewController,
                  maxLength: 500,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: "Tulis ulasan Anda",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Ulasan tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                if (rating == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Silakan pilih rating sebelum mengirim."),
                    ),
                  );
                  return;
                }

                if (_formKey.currentState!.validate()) {
                  try {
                    PostUlasanDTO postUlasanDTO = PostUlasanDTO(
                      idMotor: widget.motor.idMotor!,
                      idPelanggan: userId!,
                      rating: rating,
                      komentar: reviewController.text,
                    );

                    ApiService()
                        .ulasanApi
                        .apiUlasanPost(postUlasanDTO: postUlasanDTO);

                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      title: 'Success',
                      desc: 'Ulasan berhasil dikirim.',
                      btnOkOnPress: () {
                        Navigator.pop(context);
                      },
                    ).show();

                    // // Show success snackbar
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text("Ulasan berhasil dikirim!"),
                    //   ),

                    // );
                  } catch (e) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      title: 'Error',
                      desc: 'Gagal mengirim ulasan. Silakan coba lagi.',
                      btnOkOnPress: () {
                        Navigator.pop(context);
                      },
                    ).show();
                    print('Error sending review: $e');
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Silakan isi ulasan dengan benar."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: AppColors.B400),
              child: const Text(
                'Kirim',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void getRatingFromUlasan() {
    ApiService()
        .motorApi
        .apiMotorIdUlasansGet(widget.motor.idMotor!)
        .then((value) {
      if (value != null) {
        double totalRating = 0;
        int count = 0;

        for (var ulasan in value) {
          if (ulasan.rating != null) {
            totalRating += ulasan.rating!;
            count++;
          }
        }

        setState(() {
          rating = count > 0 ? totalRating / count : null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              // Nama page
              'Details',
              style: AppTextStyle.body1SemiBold,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto motor
              Center(
                child: Container(
                  width: 210,
                  height: 184,
                  child: Builder(
                    builder: (context) {
                      final frontImage = widget.motor.motorImage?.front;
                      if (frontImage != null && frontImage.isNotEmpty) {
                        return Image.network(
                          "http://160.19.167.222:5103/storage/fetch/$frontImage",
                          fit: BoxFit.cover,
                        );
                      } else {
                        return Image.asset(
                          'assets/images/general-img-landscape.png',
                          fit: BoxFit.cover,
                        );
                      }
                    },
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 27.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Nama motor
                            Text(
                              '${widget.motor.model}, ${widget.motor.tipe}',
                              style: AppTextStyle.body2SemiBold,
                            ),

                            ElevatedButton(
                              onPressed: () async {
                                int? userId = (await ApiService()
                                        .penggunaApi
                                        .penggunaCurrentPenggunaGet())!
                                    .pelanggan
                                    ?.idPelanggan;

                                List<Transaksi>? transaksi = (await ApiService()
                                    .transaksiApi
                                    .apiTransaksiGet(
                                      idPelanggan: userId.toString(),
                                    ));

                                //Filter transaksi untuk motor ini
                                transaksi = transaksi
                                    ?.where((t) =>
                                        t.idMotor == widget.motor.idMotor)
                                    .toList();

                                //  Check jika pengguna sudah memberikan ulasan
                                if (transaksi == null || transaksi.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Anda harus menyewa motor ini terlebih dahulu sebelum memberikan ulasan."),
                                    ),
                                  );
                                } else if (widget.motor.ulasan != null &&
                                    widget.motor.ulasan!.any((ulasan) =>
                                        ulasan.idPelanggan == userId)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Anda sudah memberikan ulasan untuk motor ini."),
                                    ),
                                  );
                                } else {
                                  showUlasanDialog(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                elevation: 1.0,
                                padding: const EdgeInsets.all(12),
                                backgroundColor: Colors.white,
                              ),
                              child: Row(children: [
                                Text(
                                  rating.toString().substring(0, 3) ?? '-',
                                  style: AppTextStyle.body3SemiBold,
                                ),
                                const Icon(
                                  CupertinoIcons.star_fill,
                                  color: const Color(0xFFFFE100),
                                  size: 14,
                                ),
                              ]),
                            ),
                          ],
                        ),

                        // Transmisi dan tahun
                        Text(
                          '${widget.motor.transmisi}, ${widget.motor.tahun}',
                          style: AppTextStyle.smallReguler,
                        ),
                        const SizedBox(
                          height: 12,
                        ),

                        // Label deskripsi
                        Text(
                          'Deskripsi',
                          style: AppTextStyle.body3SemiBold,
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        // Deskripsi motor
                        Text(
                          'This motorbike has ample legroom and a comfortable seating position, making it ideal for long-distance travel. The seat is designed with soft padding',
                          style: AppTextStyle.smallReguler,
                        ),
                        const SizedBox(
                          height: 12,
                        ),

                        // Label spesifikasi
                        Text(
                          'Spesifikasi',
                          style: AppTextStyle.body3SemiBold,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Label brand
                            Text(
                              'Brand',
                              style: AppTextStyle.smallReguler,
                            ),

                            // Brand motor
                            Text(widget.motor.brand!,
                                style: AppTextStyle.smallReguler),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Label tipe
                            Text(
                              'Type',
                              style: AppTextStyle.smallReguler,
                            ),

                            // Tipe motor
                            Text(widget.motor.tipe!,
                                style: AppTextStyle.smallReguler),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Label tahun
                            Text(
                              'Tahun',
                              style: AppTextStyle.smallReguler,
                            ),

                            // Tahun motor
                            Text("${widget.motor.tahun}",
                                style: AppTextStyle.smallReguler),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Label transmisi
                            Text(
                              'Transmisi',
                              style: AppTextStyle.smallReguler,
                            ),

                            // Transmisi motor
                            Text(widget.motor.transmisi!.value.toString(),
                                style: AppTextStyle.smallReguler),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Label nomor polisi
                            Text(
                              'Police Number',
                              style: AppTextStyle.smallReguler,
                            ),

                            // Nomor polisi motor
                            Text(widget.motor.platNomor!,
                                style: AppTextStyle.smallReguler),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -1),
                    blurRadius: 4,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: AppTextStyle.smallReguler,
                      ),
                      Row(
                        children: [
                          Text(
                            "Rp. ${formatter.format(widget.motor.hargaHarian)}",
                            style: AppTextStyle.body3SemiBold.copyWith(
                              color: AppColors.B400,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            '/day',
                            style: AppTextStyle.body3SemiBold.copyWith(
                              color: AppColors.N600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 10,
                    ),

                    // Booking Motor
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookMotorcyclePage(
                                      motor: widget.motor,
                                      selectedDateRange:
                                          widget.selectedDateRange,
                                    )));
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: AppColors.B400),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
