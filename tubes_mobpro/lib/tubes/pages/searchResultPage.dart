import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/extension/motor.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/cardHomePage_widgets.dart';

class SearchResult extends StatelessWidget {
  const SearchResult(
      {super.key,
      required this.transimission,
      required this.selectedDateRange});

  final String transimission;
  final DateTimeRange? selectedDateRange;

  Widget buildVehicleRow(List<Motor> motors) {
    List<Widget> vehicleCards = [];
    for (var _ in motors) {
      for (int i = 0; i < motors.length; i++) {
        Widget? card;

        if (motors[i].getBestDiscount() != null) {
          if (motors[i]
              .getBestDiscount()!
              .tanggalAkhir!
              .isBefore(DateTime.now())) {
            continue;
          }

          double disPrice = (motors[i].hargaHarian! -
              motors[i].getBestDiscount()!.jumlahDiskon!);

          card = vehicleCardDiscount(
            motor: motors[i],
            disPrice: disPrice,
          );
        } else {
          card = vehicleCard(
            margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
            motor: motors[i],
          );
        }

        vehicleCards.add(
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 5, right: 10),
              child: card),
        );

        // Tambahkan gap kecuali setelah card terakhir
      }
    }

    // Membagi ke dalam row (maksimal 2 card per baris)
    List<Widget> rows = [];
    for (int i = 0; i < vehicleCards.length; i += 2) {
      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            vehicleCards[i],
            if (i + 1 < vehicleCards.length)
              vehicleCards[i + 1], // Menambahkan card ke-2 jika ada
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transimission == "" ? "-" : transimission,
              style: AppTextStyle.body1SemiBold,
            ),
            // Text(
            //   date == "" ? "-" : date,
            //   style: AppTextStyle.body3Regular,
            // )
          ],
        ),
      ),
      body: FutureBuilder(
        future: ApiService().motorApi.apiMotorGet(

            // Penggantian setelah perubahan enum
            // Mengubah string ke enum
            transmisi: transimission == "Manual"
                ? TransmisiMotor.manual
                : TransmisiMotor.matic,
            withDiskon: true,
            withImage: true,
            withUlasan: true,
            page: 1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No motors available'));
          }
          return SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10, left: 5, right: 10),
                padding: const EdgeInsets.only(right: 20),
                width: double.infinity,
                child: buildVehicleRow(
                    MotorHelper.removeBookedMotors(snapshot.data!) ?? [])),
          );
        },
      ),
    );
  }
}
