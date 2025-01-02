import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_utilities/motor.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/pages/notification_page.dart';
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
                          builder: (context) => const NotificationPage()
                        )
                      );
                    },
                    icon: const Icon(Icons.notifications)
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: Text(
                    "Good Morning\nMichael",
                    style: AppTextStyle.h2Bold.copyWith(color: AppColors.N0),
                  )
                ),
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
                    ]
                  ),
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
                        hintText: 'Choose the models...'
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
                                  builder: (context) => const SearchResultPage()
                                )
                              );
                            }
                          )
                        ),
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
                                vehicleName: motors[0].brand,
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
                                vehicleName: snapshot.data![1].brand,
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              vehicleCard(
                                margin: const EdgeInsets.only(top: 20, right: 10,left: 10),
                                imagePath: "assets/images/NMAX.png",
                                vehicleName: "NMAX",
                                rating: '4.8',
                                transmition: "Transmission: Matic",
                                price: "Rp. 70.000,00",
                              ),
                              SizedBox(width: 10,),
                              vehicleCard(
                                margin: const EdgeInsets.only(top: 20, ),
                                imagePath: "assets/images/BeAT.png",
                                vehicleName: "BeAT",
                                rating: '4.8',
                                transmition: "Transmission: Matic",
                                price: "Rp. 40.000,00",
                              ),
                              SizedBox(width: 10,),
                              vehicleCard(
                                margin: const EdgeInsets.only(top: 20, right: 10,left: 10),
                                imagePath: "assets/images/NMAX.png",
                                vehicleName: "Vario",
                                rating: '4.8',
                                transmition: "Transmission: Matic",
                                price: "Rp. 50.000,00",
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Text('Discount', style: AppTextStyle.body2Bold),
                        Column(
                          
                          children: [
                            // Row 1 
                            Row(
                              children: [
                                vehicleCardDiscount(
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                                vehicleCardDiscount(
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            // Row 2
                            Row(
                              
                              children: [
                                vehicleCardDiscount(
                                  
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                                vehicleCardDiscount(
                                  
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            // Row 3
                            Row(
                              
                              children: [
                                vehicleCardDiscount(
                                  
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                                vehicleCardDiscount(
                                  
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            // Row 4
                            Row(
                            
                              children: [
                                vehicleCardDiscount(
                                  
                                 margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                                vehicleCardDiscount(
                                
                                  margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                                  imagePath: "assets/images/NMAX.png",
                                  vehicleName: 'NMAX',
                                  rating: '4.8',
                                  transmition: 'Transmission: Matic',
                                  disPrice: 'Rp. 50.000,00',
                                  norPrice: 'Rp. 70.000,00',
                                ),
                              ],
                            ),
                          ],
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