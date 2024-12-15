import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_page.dart';
import 'package:tubes_mobpro/tubes/services/motor.dart';
import 'package:tubes_mobpro/tubes/services/motor_service.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/bottom_nav.dart';
import 'package:tubes_mobpro/tubes/widgets/cardHomePage_widgets.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

enum MotorType { Matic, Manual }

List<String> models = [''];

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  MotorType? _selectedTransmission;

  final formatter = NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Image.asset(
                  "assets/images/hpElement1.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
                Positioned(
                  top: 50,
                  right: 30,
                  child: IconButton(
                      color: AppColors.N0,
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(Icons.notifications)),
                ),
                Positioned(
                    top: 40,
                    left: 30,
                    child: Text(
                      "Good Morning\nMichael",
                      style: AppTextStyle.h2Bold.copyWith(color: AppColors.N0),
                    )),
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  margin: const EdgeInsets.only(
                    top: 130,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      const Gap(20),
                      const TextfieldWidget(
                          label: 'Select Date',
                          prefixIcon: Icon(Icons.date_range_rounded),
                          hintText: 'Choose the date...'),
                      const Gap(24),
                      const TextfieldWidget(
                          label: 'Select Models',
                          prefixIcon: Icon(Icons.motorcycle_rounded),
                          hintText: 'Chose the models...'),
                      const Gap(24),
                      Positioned(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Models',
                                style: TextStyle(),
                              ),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0),
                                      title: const Text('Manual'),
                                      titleTextStyle: const TextStyle(
                                          fontSize: 15, color: Colors.black),
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
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(30),
                      SizedBox( 
                          width: 150,
                          height: 40,
                          child: ButtonWidget.primary(
                              label: "Search",
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchResultPage()));
                              })),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20, right: 10),
              padding: const EdgeInsets.only(right: 20),
              // height: 300,
              width: double.infinity,
              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text('Recomendation'),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      // vehicleCard(
                      //   height: 260,
                      //   width: 200,
                      //   margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
                      //   imagePath: "assets/images/NMAX_highRes.png",
                      //   vehicleName: 'NMAX',
                      //   rating: '4.8',
                      //   transmition: 'Transmision: Matic',
                      //   price: 'Rp. 30.000,00',
                      // ),
                      vehicleCard(
                        height: 260,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        imagePath: "assets/images/NMAX.png",
                        vehicleName: 'NMAX',
                        rating: '4.8',
                        transmition: 'Transmision: Matic',
                        price: 'Rp. 30.000,00',
                      ),
                      vehicleCard(
                        height: 260,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        imagePath: "assets/images/NMAX.png",
                        vehicleName: 'NMAX',
                        rating: '4.8',
                        transmition: 'Transmision: Matic',
                        price: 'Rp. 30.000,00',
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        child: const Text('Most Populer'),
                      ),
                    ],
                  ),
                  FutureBuilder<List<Motor>>(
                    future: MotorService().fetchAll(),
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
                                height: 260,
                                width: 200,
                                margin: const EdgeInsets.only(
                                    top: 20, right: 20, left: 20),
                                imagePath: "assets/images/NMAX.png",
                                vehicleName: motors[0].tipe,
                                rating: '4.8',
                                transmition:
                                    "Transmision: ${motors[0].transmisi}",
                                price:
                                    "Rp. ${formatter.format(motors[0].hargaHarian)}",
                              ),
                              vehicleCard(
                                height: 260,
                                width: 200,
                                margin: const EdgeInsets.only(
                                    top: 20, right: 20, left: 20),
                                imagePath: "assets/images/NMAX.png",
                                vehicleName: motors[1].tipe,
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
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10, top: 20),
                        child: const Text('Discount'),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      vehicleCardDiscount(
                        height: 270,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        imagePath: "assets/images/NMAX.png",
                        vehicleName: 'NMAX',
                        rating: '4.8',
                        transmition: 'Transmision: Matic',
                        disPrice: '123',
                        norPrice: '2022',
                      ),
                      vehicleCardDiscount(
                        height: 270,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        imagePath: "assets/images/NMAX.png",
                        vehicleName: 'NMAX',
                        rating: '4.8',
                        transmition: 'Transmision: Matic',
                        disPrice: '123',
                        norPrice: '2022',
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      vehicleCardDiscount(
                        height: 270,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        imagePath: "assets/images/NMAX.png",
                        vehicleName: 'NMAX',
                        rating: '4.8',
                        transmition: 'Transmision: Matic',
                        disPrice: '123',
                        norPrice: '2022',
                      ),
                      vehicleCardDiscount(
                        height: 270,
                        width: 200,
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        imagePath: "assets/images/NMAX.png",
                        vehicleName: 'NMAX',
                        rating: '4.8',
                        transmition: 'Transmision: Matic',
                        disPrice: '123',
                        norPrice: '2022',
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
