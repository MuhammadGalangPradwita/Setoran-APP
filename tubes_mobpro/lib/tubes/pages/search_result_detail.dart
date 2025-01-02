import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_utilities/motor.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/pages/motor_book_page.dart';
import 'package:tubes_mobpro/tubes/services/motor_service.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class SearchResultDetail extends StatefulWidget {
  const SearchResultDetail({super.key, required this.index});

  final int index;

  @override
  State<SearchResultDetail> createState() => _SearchResultDetailState();
}

class _SearchResultDetailState extends State<SearchResultDetail> {

  final formatter = NumberFormat("#,###");

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
              style: AppTextStyle.body3SemiBold,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: FutureBuilder<Motor>(
            future: MotorAPi.getMotor(widget.index),
            builder:
                (BuildContext context, AsyncSnapshot<Motor> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No motors available'));
              } else {

                Motor motor = snapshot.data!;

                return Stack(
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
                            child: Image.asset(
                              'assets/images/NMAX.png',
                              fit: BoxFit.fitHeight,
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
                                        '${motor.model}, ${motor.tipe}',
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
                                    '${motor.transmisi}, ${motor.tahun}',
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
                                      Text(motor.brand,
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
                                      Text(motor.tipe,
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
                                      Text("${motor.tahun}",
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
                                      Text(motor.transmisi,
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
                                      Text(motor.platNomor,
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
                                      "Rp. ${formatter.format(motor.hargaHarian)}",
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookMotorcyclePage(motor: motor,)));
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
                );
              }
            }),
      ),
    );
  }
}
