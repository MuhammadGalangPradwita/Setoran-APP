import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_detail.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/cardHomePage_widgets.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yamaha, NMAX',
                style: AppTextStyle.body1SemiBold,
              ),
              Text(
                'Sun, 26 Oct 2024 ',
                style: AppTextStyle.body3Regular,
              )
            ],
        ),
       
      ),
      
      body: SingleChildScrollView(
        child: Container(
               margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
                    padding: const EdgeInsets.only(right: 20),
                    // height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          ],
                        ),
                        Row(
                          children: [
                            vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          ],
                        ),
                        Row(
                          children: [
                            vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          ],
                        ),
                        Row(
                          children: [
                            vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          vehicleCard(
                            height: 210,
                            width: 160,
                            margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                            imagePath: "assets/images/NMAX.png",
                            vehicleName: 'NMAX',
                            rating: '4.8',
                            transmition: 'Transmision: Matic',
                            price: 'Rp. 40.000,00',
                          ),
                          ],
                        )
                      ],
                    )
        ),
      ),
    );
  }
}