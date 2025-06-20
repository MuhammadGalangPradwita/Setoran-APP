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

  DateTimeRange? _selectedDateRange;

  final formatter = NumberFormat("#,###");

  final _modelController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Future<List<Ulasan>?> getUlasanByMotorId(int? idMotor) async {
    if (idMotor == null) return [];
    final allUlasan =
        await ApiService().motorApi.apiMotorIdUlasansGet(idMotor) ?? null;
    return allUlasan;
  }

  Widget buildHorizontalVehicleList(List<Motor> motors, bool isDiscount) {
    List<Widget> vehicleCards = [];
    for (int i = 0; i < motors.length; i++) {
      Widget empty = const SizedBox.shrink();

      Widget card = empty;

      if (isDiscount && motors[i].getBestDiscount() != null) {
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
      } else if (isDiscount) {
        continue;
      } else {
        card = vehicleCard(
          margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
          motor: motors[i],
        );
      }

      vehicleCards.add(
        Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: card),
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

  List<Motor>? filterUnDiscounted(List<Motor> motors) {
    List<Motor>? filtered = motors.where((motor) {
      return motor.getBestDiscount() != null;
    }).toList();

    return filtered;
  }

  String getDateRange(DateTimeRange range) {
    String startMonth = DateFormat('MMM').format(range.start);
    String endMonth = DateFormat('MMM').format(range.end);

    String rentRange = "";

    rentRange += "$startMonth ${range.start.day} - ";

    if (range.start.month == range.end.month) {
      rentRange += "${range.end.day}";
    } else {
      rentRange += "$endMonth ${range.end.day}";
    }

    return rentRange;
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

                      // GestureDetector(
                      //   onTap: () => _selectDate(context),
                      //   child: AbsorbPointer(
                      //     child: TextfieldWidget(
                      //       controller: _dateController,
                      //       label: 'Select Date',
                      //       prefixIcon: const Icon(Icons.date_range_rounded),
                      //       hintText: 'Choose the date...',
                      //     ),
                      //   ),
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Rental duration',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),

                          // Return time button
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.grey),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            onPressed: () async {
                              final selectedRange = await showDateRangePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      primaryColor: Colors.blue,
                                      colorScheme: const ColorScheme.light(
                                          primary: Colors.blue),
                                      buttonTheme: const ButtonThemeData(
                                        textTheme: ButtonTextTheme.primary,
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (selectedRange != null) {
                                setState(() {
                                  _selectedDateRange = selectedRange;
                                });
                              }
                            },
                            child: Text(
                              _selectedDateRange != null
                                  ? getDateRange(_selectedDateRange!)
                                  : 'Pick a Date',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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
                            child: (_selectedTransmission != null)
                                ? ButtonWidget.primary(
                                    label: "Search",
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder:
                                                  (context) => SearchResult(
                                                        selectedDateRange: _selectedDateRange ??
                                                            DateTimeRange(
                                                                start: DateTime
                                                                    .now(),
                                                                end: DateTime
                                                                        .now()
                                                                    .add(const Duration(
                                                                        days:
                                                                            1))),
                                                        transimission:
                                                            _selectedTransmission !=
                                                                    null
                                                                ? _selectedTransmission!
                                                                    .name
                                                                : "",
                                                      )));
                                    })
                                : ButtonWidget.secondary(
                                    label: "Search",
                                    press: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Pilih transaksi!')),
                                      );
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
                  FutureBuilder<List<Motor>?>(
                    future: ApiService().motorApi.apiMotorGet(
                        withImage: true,
                        withDiskon: true,
                        withUlasan: true,
                        sorting: MotorSorting.bestRating),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No motors available'));
                      } else {
                        final List<Motor> motors =
                            MotorHelper.removeBookedMotors(snapshot.data!)!;
                        return buildHorizontalVehicleList(motors, false);
                      }
                    },
                  ),
                  const Gap(20),
                  Text('Most Popular', style: AppTextStyle.body2Bold),
                  FutureBuilder<List<Motor>?>(
                    future: ApiService().motorApi.apiMotorGet(
                        withImage: true,
                        withDiskon: true,
                        withUlasan: true,
                        sorting: MotorSorting.mostPopular),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No motors available'));
                      } else {
                        final List<Motor> motors =
                            MotorHelper.removeBookedMotors(snapshot.data!)!;
                        return buildHorizontalVehicleList(motors, false);
                      }
                    },
                  ),
                  const Gap(20),
                  const VoucherCard(),
                  const Gap(20),
                  Text('Discount', style: AppTextStyle.body2Bold),
                  FutureBuilder<List<Motor>?>(
                    future: ApiService().motorApi.apiMotorGet(
                        withImage: true,
                        withDiskon: true,
                        withUlasan: true,
                        sorting: MotorSorting.bestDiscount),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        List<Motor>? motors =
                            MotorHelper.removeBookedMotors(snapshot.data!)!;

                        motors = filterUnDiscounted(motors);

                        if (!snapshot.hasData ||
                            snapshot.data!.isEmpty ||
                            motors == null ||
                            motors.isEmpty) {
                          return const Center(
                              child: Text('No motors available'));
                        }
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
