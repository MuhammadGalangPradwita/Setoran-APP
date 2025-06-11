import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/extension/motor.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/notification_page.dart';
import 'package:tubes_mobpro/tubes/pages/searchResultPage.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/cardHomePage_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

import '../api_service.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

enum MotorType { Matic, Manual }

class _HomepageScreenState extends State<HomepageScreen> {
  MotorType? _selectedTransmission;
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  final formatter = NumberFormat("#,###");

  final _modelController = TextEditingController();

  Future<List<Ulasan>?> getUlasanByMotorId(int? idMotor) async {
    if (idMotor == null) return [];
    final allUlasan =
        await ApiService().motorApi.apiMotorIdUlasansGet(idMotor) ?? null;
    return allUlasan;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Old function to build the discount motor list

  // Widget buildDiscountMotorList(List<Motor> motors) {
  // List<Widget> rows = [];
  // for (int i = 0; i < motors.length; i += 2) {
  //   int endIndex = i + 1;
  //   if (endIndex >= motors.length) endIndex = i;

  //   rows.add(
  //     Row(
  //       children: [
  //         Expanded(
  //           child: FutureBuilder<List<Ulasan>?>(
  //             future: getUlasanByMotorId(motors[i].idMotor),
  //             builder: (context, snapshot) {
  //               String rating = '-';
  //               if (snapshot.hasData && snapshot.data!.isNotEmpty) {
  //                 // Ambil rata-rata rating jika ada lebih dari satu ulasan
  //                 double avg = snapshot.data!
  //                     .map((u) => u.rating ?? 0)
  //                     .fold(0.0, (a, b) => a + b) /
  //                     snapshot.data!.length;
  //                 rating = avg.toStringAsFixed(1);
  //               }
  //               return vehicleCardDiscount(
  //                 // margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
  //                 // imagePath: motors[i].motorImage?.front ?? "assets/images/NMAX.png",
  //                 // vehicleName: motors[i].model ?? "",
  //                 // rating: rating,
  //                 // transmition: '${motors[i].transmisi}',
  //                 ulasan: null,
  //                 disPrice: 'Rp. ${formatter.format(motors[i].hargaHarian)}',
  //                 // norPrice: 'Rp. ${formatter.format(motors[i].hargaHarian)}',
  //                 motor: motors[i],
  //               );
  //             },
  //           ),
  //         ),
  //         if (endIndex < motors.length) ...[
  //           const SizedBox(width: 16),
  //           Expanded(
  //             child: FutureBuilder<List<Ulasan>?>(
  //               future: getUlasanByMotorId(motors[endIndex].idMotor),
  //               builder: (context, snapshot) {
  //                 String rating = '-';
  //                 if (snapshot.hasData && snapshot.data!.isNotEmpty) {
  //                   double avg = snapshot.data!
  //                       .map((u) => u.rating ?? 0)
  //                       .fold(0.0, (a, b) => a + b) /
  //                       snapshot.data!.length;
  //                   rating = avg.toStringAsFixed(1);
  //                 }
  //                 return vehicleCardDiscount(
  //                   // margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
  //                   // imagePath: motors[endIndex].motorImage?.front ?? "assets/images/NMAX.png",
  //                   // vehicleName: motors[endIndex].model ?? "",
  //                   // rating: rating,
  //                   // transmition: '${motors[endIndex].transmisi}',
  //                   ulasan: null,
  //                   disPrice: 'Rp. ${formatter.format(motors[endIndex].hargaHarian)}',
  //                   // norPrice: 'Rp. ${formatter.format(motors[endIndex].hargaHarian)}',
  //                   motor: motors[i],
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       ],
  //     ),
  //   );
  //   rows.add(const SizedBox(height: 10)); // Jarak antar baris
  // }

//   return Column(
//     children: rows,
//   );
// }

  Widget buildHorizontalVehicleList(List<Motor> motors, bool isDiscount) {
    List<Widget> vehicleCards = [];
    for (int i = 0; i < motors.length; i++) {
      vehicleCards.add(
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: FutureBuilder<List<Ulasan>?>(
            future: getUlasanByMotorId(motors[i].idMotor),
            builder: (context, snapshot) {
              List<Ulasan>? ulasan;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return vehicleCard(
                  ulasan: null,
                  margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  motor: motors[i],
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                ulasan = snapshot.data!;
              } else if (snapshot.hasData && snapshot.data!.isEmpty) {
                ulasan = null;
              }

              if (isDiscount && motors[i].diskon!.isNotEmpty) {
                print('in');

                double disPrice = (motors[i].hargaHarian! - motors[i].getBestDiscount()!.jumlahDiskon!);

                return vehicleCardDiscount(ulasan: ulasan, motor: motors[i], disPrice: disPrice,);
              } else if (isDiscount && motors[i].diskon!.isNotEmpty == false) {
                return SizedBox();
              }

              print('out');
              return vehicleCard(
                ulasan: ulasan,
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                motor: motors[i],
              );
            },
          ),
        ),
      );
      // Tambahkan gap kecuali setelah card terakhir
      if (i != motors.length - 1) {
        vehicleCards.add(const SizedBox(width: 16)); // Jarak antar card
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: vehicleCards,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/hpElement1.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 50,
                  right: 30,
                  child: IconButton(
                      color: AppColors.N0,
                      iconSize: 30,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationPage()));
                      },
                      icon: const Icon(Icons.notifications)),
                ),
                Positioned(
                    top: 40,
                    left: 30,
                    child: Builder(builder: (context) {
                      var auth = Provider.of<AuthState>(context);
                      return Text(
                        "Good Morning\n${auth.currentUser == null ? "" : auth.currentUser!.nama}",
                        style:
                            AppTextStyle.h2Bold.copyWith(color: AppColors.N0),
                      );
                    })),
                Container(
                  margin: const EdgeInsets.only(
                    top: 130,
                    left: 30,
                    right: 30,
                  ),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Date Picker

                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextfieldWidget(
                            controller: _dateController,
                            label: 'Select Date',
                            prefixIcon: const Icon(Icons.date_range_rounded),
                            hintText: 'Choose the date...',
                          ),
                        ),
                      ),

                      const Gap(24),

                      const Text('Models'),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Matic'),
                              leading: Radio<MotorType>(
                                value: MotorType.Matic,
                                groupValue: _selectedTransmission,
                                onChanged: (MotorType? value) {
                                  setState(() {
                                    _selectedTransmission = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Manual'),
                              leading: Radio<MotorType>(
                                value: MotorType.Manual,
                                groupValue: _selectedTransmission,
                                onChanged: (MotorType? value) {
                                  setState(() {
                                    _selectedTransmission = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(30),
                      Center(
                        child: SizedBox(
                            width: 150,
                            height: 40,
                            child: ButtonWidget.primary(
                                label: "Search",
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchResult(
                                                date: _dateController.text,
                                                model: _modelController.text,
                                                transimission:
                                                    _selectedTransmission !=
                                                            null
                                                        ? _selectedTransmission!
                                                            .name
                                                        : "",
                                              )));
                                })),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  Text('Recommendation', style: AppTextStyle.body2Bold),
                  const Gap(20),
                  FutureBuilder<List<Motor>?>(
                    future: ApiService().motorApi.apiMotorGet(
                        withImage: true, withDiskon: true, withUlasan: true),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No motors available'));
                      } else {
                        final List<Motor> motors =
                            Motor().removeBookedMotors(snapshot.data!)!;
                        return buildHorizontalVehicleList(motors, false);
                      }
                    },
                  ),

                  const Gap(20),
                  Text('Most Popular', style: AppTextStyle.body2Bold),
                  const Gap(20),

                  FutureBuilder<List<Motor>?>(
                    future: ApiService().motorApi.apiMotorGet(
                        withImage: true, withDiskon: true, withUlasan: true),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No motors available'));
                      } else {
                        final List<Motor> motors =
                            Motor().removeBookedMotors(snapshot.data!)!;
                        return buildHorizontalVehicleList(motors, false);
                      }
                    },
                  ),

                  const Gap(20),
                  VoucherCard(),
                  const Gap(20),
                  Text('Discount', style: AppTextStyle.body2Bold),
                  const Gap(10),
                  FutureBuilder<List<Motor>?>(
                    future: ApiService().motorApi.apiMotorGet(
                        withImage: true,
                        withDiskon: true,
                        withUlasan: true),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData ||
                          snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('No motors available'));
                      } else {
                        final List<Motor> motors =
                            Motor().removeBookedMotors(snapshot.data!)!;
                        return buildHorizontalVehicleList(motors, true);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
