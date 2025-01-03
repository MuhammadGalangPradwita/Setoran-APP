import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_utilities/motor.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/notification_page.dart';
import 'package:tubes_mobpro/tubes/pages/searchResultPage.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_page.dart';
import 'package:tubes_mobpro/tubes/services/motor_service.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/cardHomePage_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

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

  Widget buildMotorList(List<Motor> motors) {
    List<Widget> rows = [];
    for (int i = 0; i < motors.length; i += 2) {
      // Ambil dua motor sekaligus untuk setiap baris
      int endIndex = i + 1;
      if (endIndex >= motors.length) endIndex = i;

      rows.add(
        Row(
          children: [
            vehicleCardDiscount(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              // imagePath: motors[i].imagePath,  // Asumsikan ada properti imagePath di Motor
              imagePath: "assets/images/NMAX.png",
              vehicleName:
                  motors[i].model, // Ganti dengan data motor yang sesuai
              // rating: motors[i].brand.toString(),  // Ganti dengan rating motor
              rating: '4.8',
              transmition:
                  'Transmission: ${motors[i].transmisi}', // Asumsikan ada properti transmisi
              disPrice:
                  'Rp. ${formatter.format(motors[i].hargaHarian)}', // Ganti dengan harga diskon
              norPrice:
                  'Rp. ${formatter.format(motors[i].hargaHarian)}', // Ganti dengan harga normal
            ),
            if (endIndex <
                motors.length) // Jika ada motor kedua di baris yang sama
              vehicleCardDiscount(
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                // imagePath: motors[endIndex].imagePath,  // Asumsikan ada properti imagePath di Motor
                imagePath: "assets/images/NMAX.png",
                vehicleName: motors[endIndex]
                    .model, // Ganti dengan data motor yang sesuai
                rating: '4.8',
                // rating: motors[endIndex].brand.toString(),  // Ganti dengan rating motor
                transmition:
                    'Transmission: ${motors[endIndex].transmisi}', // Asumsikan ada properti transmisi
                disPrice:
                    'Rp. ${formatter.format(motors[endIndex].hargaHarian)}', // Ganti dengan harga diskon
                norPrice:
                    'Rp. ${formatter.format(motors[endIndex].hargaHarian)}', // Ganti dengan harga normal
              ),
          ],
        ),
      );
      rows.add(const SizedBox(height: 10)); // Jarak antar baris
    }

    return Column(
      children: rows,
    );
  }

  Widget buildHorizontalVehicleList(List<Motor> motors) {
    // Membuat list widget untuk vehicleCard
    List<Widget> vehicleCards = motors.map((motor) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: vehicleCard(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          // imagePath: motor.imagePath ?? "assets/images/default.png", // Pastikan ada 'imagePath' pada model Motor
          imagePath: "assets/images/NMAX.png",
          vehicleName: motor.tipe,
          // rating: motor.rating?.toString() ?? '4.8',  // Assuming rating is a field in Motor model
          rating: '4.8',
          transmition: "Transmission: ${motor.transmisi}",
          price: "Rp. ${formatter.format(motor.hargaHarian)}", // Format harga
        ),
      );
    }).toList();

    // Menambahkan SizedBox di antara setiap vehicleCard
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          vehicleCard(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            imagePath: "assets/images/NMAX.png",
            vehicleName: motors[1].model,
            rating: '4.8',
            transmition: "Transmision: ${motors[0].transmisi}",
            price: "Rp. ${formatter.format(motors[0].hargaHarian)}",
          ),

          vehicleCard(
            margin: const EdgeInsets.only(
              top: 20,left: 10, right: 10
            ),
            imagePath: "assets/images/NMAX.png",
            vehicleName: motors[1].model,
            rating: '4.8',
            transmition: "Transmision: ${motors[0].transmisi}",
            price: "Rp. ${formatter.format(motors[0].hargaHarian)}",
          ),

          vehicleCard(
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            imagePath: "assets/images/NMAX.png",
            vehicleName: motors[1].model,
            rating: '4.8',
            transmition: "Transmision: ${motors[0].transmisi}",
            price: "Rp. ${formatter.format(motors[0].hargaHarian)}",
          ), // Menambahkan semua vehicleCard ke dalam Row
        ],
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
                      const TextfieldWidget(
                          label: 'Select Models',
                          prefixIcon: Icon(Icons.motorcycle_rounded),
                          hintText: 'Choose the models...'),
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
                                          builder: (context) =>
                                              const SearchResult()));
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
                  Text('Recommendation', style: AppTextStyle.body2Bold),
                  FutureBuilder<List<Motor>>(
                    future: MotorAPi.getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No motors available'));
                      } else {
                        final List<Motor> motors = snapshot.data!;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              vehicleCard(
                                // height: 260,
                                // width: 200,
                                margin: const EdgeInsets.only(
                                    top: 20, right: 20, left: 20),
                                imagePath: "assets/images/NMAX.png",
                                vehicleName: motors[1].model,
                                rating: '4.8',
                                transmition:
                                    "Transmision: ${motors[0].transmisi}",
                                price:
                                    "Rp. ${formatter.format(motors[0].hargaHarian)}",
                              ),
                              vehicleCard(
                                // height: 260,
                                // width: 200,
                                margin: const EdgeInsets.only(
                                    top: 20, right: 20, left: 20),
                                imagePath: "assets/images/NMAX.png",
                                vehicleName: motors[1].model,
                                rating: '4.8',
                                transmition:
                                    "Transmision: ${motors[1].transmisi}",
                                price:
                                    "Rp. ${formatter.format(motors[1].hargaHarian)}",
                              )
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const Gap(20),
                  const VoucherCard(),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Most Popular', style: AppTextStyle.body2Bold),
                        FutureBuilder<List<Motor>>(
                          future: MotorAPi.getAll(),
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
                              final List<Motor> motors = snapshot.data!;
                              return buildHorizontalVehicleList(motors);
                            }
                          },
                        ),
                        const Gap(20),
                        Text('Discount', style: AppTextStyle.body2Bold),
                        FutureBuilder<List<Motor>>(
                          future: MotorAPi.getAll(),
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
                              final List<Motor> motors = snapshot.data!;
                              return buildMotorList(motors);
                            }
                          },
                        ),
                      ],
                    ),
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
