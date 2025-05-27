import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/register_motorcycle_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class MyMotorcyclePage extends StatefulWidget {
  final bool isRegistered;
  const MyMotorcyclePage({super.key, required this.isRegistered});

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
    // final resPengguna = await PenggunaApi.getCurrentUser();
    final resPengguna = await ApiService().penggunaApi.penggunaCurrentPenggunaGet();
    // TODO: create get mitra by pengguna id endpoint
    // final resMitra = await MitraApi.getMitraByIdPengguna(resPengguna!.id);
    final resMitra = AuthState().currentUser!.mitra;
    final resMotor =
        await MotorApi().apiMotorGet(idMitra: resMitra!.idMitra! as String);
    final resTransaksi = await TransaksiApi().apiTransaksiGet(query: {
      "id_mitra": resMitra.idMitra,
    });
    print("----------List Motor");
    print(resMotor!.length);
    setState(() {
      pengguna = resPengguna;
      mitra = resMitra;
      motors = resMotor;
      transaksis = resTransaksi;
    });
  }

  int calculateTotalIncome(List<Transaksi>? transaksis) {
    if (transaksis == null) return 0;
    return transaksis.fold(
        0, (total, item) => total + (item.totalHarga as int));
  }

  Widget _buildMotorList() {
    return motors!.isEmpty
        ? Center(
            child: Text(
              'No motorcycles registered yet',
              style: AppTextStyle.body1Regular,
            ),
          )
        : ListView.builder(
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

  @override
  Widget build(BuildContext context) {
    if (pengguna == null || transaksis == null || motors == null) {
      return const Center(
        child: CircularProgressIndicator(),
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
                            builder: (context) => RegisterMotorcyclePage(),
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
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: AppColors.N100,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jumlah Motor",
                            style: AppTextStyle.body1SemiBold,
                          ),
                          Text(
                            motors!.length.toString(),
                            style: AppTextStyle.body2Regular,
                          ),
                          const Gap(8),
                          Text(
                            "Total Pendapatan",
                            style: AppTextStyle.body1SemiBold,
                          ),
                          Text(
                            calculateTotalIncome(transaksis).toString(),
                            style: AppTextStyle.body2Regular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Gap(24),
                Text("Daftar Motor"),
                const Gap(8),
                _buildMotorList()
              ],
            ),
          ),
        ),
      );
    }
  }
}
