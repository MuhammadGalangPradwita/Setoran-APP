import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_utilities/motor.dart';
import 'package:tubes_mobpro/tubes/api_utilities/pembayaran.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/models/pembayaran.dart';
import 'package:tubes_mobpro/tubes/models/transaksi.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';

class DetailActivityPage extends StatefulWidget {
  final Transaksi transaksi;

  const DetailActivityPage({super.key, required this.transaksi});

  @override
  State<DetailActivityPage> createState() => _DetailActivityPageState();
}

class _DetailActivityPageState extends State<DetailActivityPage> {
  late bool _isFailed;
  late Color _paymentColor;
  Motor? motor;
  Pembayaran? pembayaran;

  @override
  void initState() {
    super.initState();
    _isFailed = widget.transaksi.status == 'batal';
    _paymentColor = _isFailed ? AppColors.R400 : AppColors.G500;
    loadMotor();
    // loadPembayaran();
  }

  Future<void> loadMotor() async {
    final result = await MotorAPi.getById(widget.transaksi.idMotor);
    final resultPembayaran =
        await PembayaranApi.getByIdTransaksi(widget.transaksi.id);
    setState(() {
      motor = result;
      pembayaran = resultPembayaran;
    });
  }

  // Future<void> loadPembayaran() async {
  //   final result = await PembayaranApi.getByIdTransaksi(widget.transaksi.id);
  //   setState(() {
  //     pembayaran = result;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (motor == null || pembayaran == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Details Activity"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: (_isFailed)
              ? [_paymentDetailCard()]
              : [_paymentDetailCard(), const Gap(20), _motorDetailCard()],
        ),
      ),
    );
  }

  Widget _paymentDetailCard() {
    return Card(
      elevation: 2,
      color: AppColors.N0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Payment ${_isFailed ? 'Failed' : "Succes"}",
                style:
                    AppTextStyle.body1SemiBold.copyWith(color: _paymentColor)),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.transaksi.id.toString(),
                  style: AppTextStyle.body3SemiBold
                      .copyWith(color: AppColors.N600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rent Date"),
                Text(AppUtil.formatDate(widget.transaksi.tanggalMulai))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rent Duration"),
                Text('${widget.transaksi.durasi} Hari')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method"),
                Text(pembayaran!.metode),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Price"),
                Text(AppUtil.formatPrice(pembayaran!.nominal))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Status"),
                Text(pembayaran!.statusPembayaran)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _motorDetailCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Detail Motorcycle",
          style: AppTextStyle.body2SemiBold,
        ),
        const Gap(8),
        Card(
          elevation: 2,
          color: AppColors.N0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Brand'),
                    Text(motor!.brand),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Type'),
                    Text(motor!.tipe),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tahun'),
                    Text(motor!.tahun.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Transmisi'),
                    Text(motor!.transmisi),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Police Number'),
                    Text(motor!.platNomor),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('STNK Number'),
                    Text(motor!.nomorSTNK),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
