import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/register_motorcycle_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class MyMotorcyclePage extends StatefulWidget {
  // final bool isRegistered;
  // const MyMotorcyclePage({super.key, required this.isRegistered});
  const MyMotorcyclePage({super.key});

  @override
  State<MyMotorcyclePage> createState() => _MyMotorcyclePageState();
}

class _MyMotorcyclePageState extends State<MyMotorcyclePage> {
  Pengguna? pengguna;
  Mitra? mitra;
  List<Motor>? motors;
  List<Transaksi>? transaksis;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    final user = await AuthState().refreshCurrentUser();
    final resMotor = await ApiService()
        .motorApi
        .apiMotorGet(idMitra: user!.mitra!.idMitra.toString());
    final resTransaksi =
        await ApiService().transaksiApi.apiTransaksiGet(query: {
      'idMitra': user.mitra!.idMitra,
    });
    // final resTransaksi =        <Transaksi>[]; // Sementara sampai API transaksi selesai diperbaiki
    print("----------List Motor");
    print(resMotor!.length);
    print(user.mitra!.idMitra);
    setState(() {
      pengguna = user;
      mitra = user.mitra;
      motors = resMotor;
      transaksis = resTransaksi;
    });
  }

  double _calculateTotalIncome(List<Transaksi>? transaksis) {
    if (transaksis == null) return 0;
    return transaksis.fold(0, (total, item) => total + (item.totalHarga!));
  }

  @override
  Widget build(BuildContext context) {
    if (pengguna == null || transaksis == null || motors == null) {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: AppColors.N0,
          color: AppColors.B400,
        ),
      );
    }
    if (mitra == null) {
      return Scaffold(
        backgroundColor: AppColors.N0,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("My Motorcycle"),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "It appears you haven't registered yet. Register your motorcycle now to become our partner",
                  style: AppTextStyle.body1Regular.copyWith(),
                  textAlign: TextAlign.center,
                ),
                const Gap(16),
                SizedBox(
                  width: 128,
                  child: ButtonWidget.primary(
                    label: 'Register',
                    press: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) =>
                      //           const RegisterMotorcyclePage(),
                      //     ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const RegisterMotorcyclePage(),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return _buildDashboard(context);
    }
  }

  Scaffold _buildDashboard(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("My Motorcycle"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          // width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text("Summary", style: AppTextStyle.h3Regular),
                  const Gap(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.directions_bike,
                            size: 30,
                          ),
                          const Gap(8),
                          Text("${motors!.length}",
                              style: AppTextStyle.h2Regular),
                          const Gap(8),
                          Text("Motorcycles Owned",
                              style: AppTextStyle.body3Regular),
                        ],
                      ),
                      const Gap(40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.money,
                            size: 30,
                          ),
                          const Gap(8),
                          Text(
                              AppUtil.formatPriceDouble(
                                  _calculateTotalIncome(transaksis)),
                              style: AppTextStyle.h2Regular),
                          const Gap(8),
                          Text("Total Income",
                              style: AppTextStyle.body3Regular),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const Gap(32),
              Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Motorcycle", style: AppTextStyle.h3Regular),
                        ],
                      ),
                      const Gap(32),
                      _buildMotorList()
                    ],
                  ),
                ),
              ]),
              const Gap(32),
              Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Transaction History",
                              style: AppTextStyle.h3Regular),
                        ],
                      ),
                      const Gap(8),
                      // _buildMotorList()
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotorList() {
    if (motors!.isEmpty) {
      return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'No motorcycles registered yet',
          style: AppTextStyle.body3Regular,
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterMotorcyclePage(),
                ));
          },
          child: Text(
            'Register now',
            style: AppTextStyle.body3Regular.copyWith(color: AppColors.B400),
          ),
        ),
      ]);
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: motors!.length,
        itemBuilder: (context, index) {
          final motor = motors![index];
          return Card(
            color: AppColors.N0,
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              title: Text(
                '${motor.brand} ${motor.tipe}',
                style: AppTextStyle.body1SemiBold,
              ),
              subtitle: Text(motor.platNomor!),
              // Add more motor details here if needed
            ),
          );
        },
      );
    }
  }
}
