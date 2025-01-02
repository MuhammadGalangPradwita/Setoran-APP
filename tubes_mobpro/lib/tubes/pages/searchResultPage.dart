import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/api_utilities/motor.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_detail.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/cardHomePage_widgets.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.date, required this.transimission, required this.model});

  final String date; // tolong test lagi nanti
  final String transimission;
  final String model;

   Widget buildVehicleRow(List<Motor> motors) {
    List<Widget> vehicleCards = [];
    for (var motor in motors) {
      vehicleCards.add(
        vehicleCard(
          // height: 210,
          // width: 160,
          margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
          imagePath: "assets/images/NMAX.png",
          vehicleName: motor.brand,
          rating: "4.8",
          transmition: motor.transmisi,
          price: motor.hargaHarian.toString(),
        ),
      );
    }

    // Membagi ke dalam row (maksimal 2 card per baris)
    List<Widget> rows = [];
    for (int i = 0; i < vehicleCards.length; i += 2) {
      rows.add(
        Row(
          children: [
            vehicleCards[i],
            if (i + 1 < vehicleCards.length) vehicleCards[i + 1], // Menambahkan card ke-2 jika ada
          ],
        ),
      );
    }

    return Column(
      children: rows,
    );
  }

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
      
      body: FutureBuilder(
        future: MotorAPi.filtered(date, transimission, model),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No motors available'));
                  } 
          final motors = snapshot.data!;
          return SingleChildScrollView(
          child: Container(
                 margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
                      padding: const EdgeInsets.only(right: 20),
                      // height: 300,
                      width: double.infinity,
                      child: buildVehicleRow(motors),
            ),
          );
        },
      ),
    );
  }
}