import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tubes_mobpro/tubes/pages/search_result_detail.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:intl/intl.dart';

final List<Map<String, dynamic>> motors = [
  {
    'brand': 'Yamaha',
    'tipe': 'Nmax',
    'tahun': 2020,
    'transmisi': 'Matic',
    'deskripsi':
        'This motorbike has ample legroom and a comfortable seating position, making it ideal for long-distance travel. The seat is designed with soft padding',
    'rating': 4.5,
    'harga': 50000,
    'diskon': {'status': true, 'persen': 0.2},
    'image': 'assets/images/NMAX.png'
  },
  {
    'brand': 'Yamaha',
    'tipe': 'Nmax',
    'tahun': 2020,
    'transmisi': 'Matic',
    'deskripsi':
        'This motorbike has ample legroom and a comfortable seating position, making it ideal for long-distance travel. The seat is designed with soft padding',
    'rating': 4.5,
    'harga': 50000000,
    'diskon': {'status': false, 'persen': 0.2},
    'image': 'assets/images/NMAX.png'
  },
];

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yamaha, NMAX',
                style: AppTextStyle.body3SemiBold,
              ),
              Text(
                'Sun, 26 Oct 2024 ',
                style: AppTextStyle.smallReguler,
              )
            ],
          ),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 27.5),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 144 / 173,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12),
                  itemCount: motors.length,
                  itemBuilder: (context, index) {
                    final motor = motors[index];
                    final diskonMotor = motor['diskon'];
                    return SearchResultCard(
                      index: index,
                    );
                  })),
        ));
  }
}

class SearchResultCard extends StatelessWidget {
  SearchResultCard({
    super.key,
    required this.index,
  });


  final formatter = NumberFormat("#,###");

  final int index;

  @override
  Widget build(BuildContext context) {

      final motor = motors[index];
    

      final String nama = motor['tipe'];
      final String transmission = motor['transmisi'];
      final String image = motor['image'];

      final int harga = motor['harga'];
      
      final diskonMotor = motor['diskon'];

      final bool statusDiskon = diskonMotor['status'];

      final double rating = motor['rating'];
      final double persenDiskon = diskonMotor['persen'];

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return SearchResultDetail(motorData: motor,);
        }));
      },
      child: Container(
        width: 144,
        height: 173,

        // Dekorasi card
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2)),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto motor
              Center(
                child: Image.asset(
                  image,
                  width: 104.69,
                ),
              ),

              const SizedBox(height: 10),

              // Title dan Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nama,
                    style: AppTextStyle.body3SemiBold,
                  ),
                  Row(
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        color: Color(0xFFFFE100),
                        size: 10,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        "$rating",
                        style: GoogleFonts.poppins(
                          fontSize: 8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Transmisi dan Informasi
              Row(
                children: [
                  const Text(
                    'Transmission: ',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    transmission,
                    style: const TextStyle(
                        fontSize: 8, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Harga motor
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      // Harga aktual
                      Text(
                        !statusDiskon
                            ? "Rp. ${formatter.format(harga)}"
                            : "Rp. ${formatter.format((harga - (persenDiskon * harga)).toInt())}",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: !statusDiskon
                              ? Colors.black
                              : Colors
                                  .red, // Akan berubah ke merah jika terdapat diskon
                        ),
                      ),

                      const SizedBox(width: 4),

                      // Harga terpotong
                      // Jika terdapat sebuah diskon
                      if (statusDiskon)
                        Text(
                          "Rp.  ${formatter.format(harga)}",
                          style: GoogleFonts.poppins(
                            fontSize: 8,
                            color: Colors.grey,
                            decoration: statusDiskon
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(
                    width: 2,
                  ),

                  // Interval pembayaran
                  Text(
                    '/day',
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
