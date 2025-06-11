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
      required this.model,
      required this.selectedDateRange});

  final String transimission;
  final String model;
  final DateTimeRange? selectedDateRange;

  Future<Widget> buildVehicleRow(List<Motor> motors) async {
    List<Widget> vehicleCards = [];
    for (var motor in motors) {
      List<Ulasan>? ulasanList =
          await ApiService().motorApi.apiMotorIdUlasansGet(motor.idMotor!);

      vehicleCards.add(
        vehicleCard(
          ulasan: ulasanList,
          margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
          motor: motor,
          selectedDateRange: selectedDateRange,
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
            if (i + 1 < vehicleCards.length)
              vehicleCards[i + 1], // Menambahkan card ke-2 jika ada
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model == "" ? "-" : model,
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
            model: model,
            withDiskon: true,
            withImage: true,
            withUlasan: true),
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
              child: FutureBuilder<Widget>(
                future: buildVehicleRow(
                    Motor().removeBookedMotors(snapshot.data!) ?? []),
                builder: (context, vehicleRowSnapshot) {
                  if (vehicleRowSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (vehicleRowSnapshot.hasError) {
                    return Center(
                        child: Text('Error: ${vehicleRowSnapshot.error}'));
                  } else {
                    return vehicleRowSnapshot.data ?? const SizedBox();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
