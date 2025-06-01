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


  SearchResultDetail({super.key, required this.motor});

  @override
  State<SearchResultDetail> createState() => _SearchResultDetailState();
}

class _SearchResultDetailState extends State<SearchResultDetail> {
  bool _isLoved = false;

  final formatter = NumberFormat("#,###");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
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
        actions: [
          IconButton(
            icon: Icon(
              _isLoved ? Icons.favorite : Icons.favorite_border,
              color: _isLoved
                  ? Colors.red
                  : Colors.black, // Warna merah saat loved
            ),
            onPressed: () {
              setState(() {
                _isLoved = !_isLoved; // Toggle status loved
              });
            },
          ),
        ],
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
                                print('Motor id: ${widget.motor.idMotor}');
                                print('Nama motor: ${widget.motor.model}');
                                print('Transmisi: ${widget.motor.transmisi}');
                                print('Tahun: ${widget.motor.tahun}');
                                print('Brand: ${widget.motor.brand}');
                                print(
                                    'Motor Image: ${widget.motor.motorImage?.front}');
                                print(
                                    'motor image id: ${widget.motor.motorImage?.id}');
                                final frontImage = widget.motor.motorImage?.front;
                                if (frontImage != null &&
                                    frontImage.isNotEmpty) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Nama motor
                                      Text(
                                        '${widget.motor.model}, ${widget.motor.tipe}',
                                        style: AppTextStyle.body2SemiBold,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            CupertinoIcons.star_fill,
                                            color: Color(0xFFFFE100),
                                            size: 14,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),

                                          //Rating motor
                                          Text(
                                            '4.8',
                                            style: AppTextStyle.body3SemiBold,
                                          )
                                        ],
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Label transmisi
                                      Text(
                                        'Transmisi',
                                        style: AppTextStyle.smallReguler,
                                      ),

                                      // Transmisi motor
                                      Text(widget.motor.transmisi!,
                                          style: AppTextStyle.smallReguler),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
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
                                      style:
                                          AppTextStyle.body3SemiBold.copyWith(
                                        color: AppColors.B400,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '/day',
                                      style:
                                          AppTextStyle.body3SemiBold.copyWith(
                                        color: AppColors.N600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(children: [
                              const Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                size: 30,
                                color: AppColors.N600,
                              ),
                              const SizedBox(
                                width: 10,
                              ),

                              // Booking Motor
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BookMotorcyclePage(
                                                motor: widget.motor,
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
                )  

      ),
    );
  }

  // Future<bool> isRented() async {
  //   // int userId = (await PenggunaApi.getCurrentUser())!.id;
  //   int userId = AuthState().currentUser!.id! as int;

  //   List<Transaksi>? transaksiList = await TransaksiApi().apiTransaksiGet(
  //     idPelanggan: userId.toString(),
  //   );

  //   if (transaksiList != null) {
  //     bool exists = transaksiList.any((v) => v.idMotor == widget.index);

  //     return exists;
  //   }

  //   return false;
  // }
}
