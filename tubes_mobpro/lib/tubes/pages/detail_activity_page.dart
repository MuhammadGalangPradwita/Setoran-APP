import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';
import 'package:tubes_mobpro/tubes/widgets/button_widgets.dart';

class DetailActivityPage extends StatefulWidget {
  final Transaksi transaksi;

  const DetailActivityPage({super.key, required this.transaksi});

  @override
  State<DetailActivityPage> createState() => _DetailActivityPageState();
}

class _DetailActivityPageState extends State<DetailActivityPage> {
  late bool _isFailed;
  // late Color _paymentColor;
  Pembayaran? pembayaran;
  late bool _isLoading;

  @override
  void initState() {
    print(widget.transaksi);
    super.initState();
    _isLoading = true;
    _isFailed = true;
    ApiService()
        .pembayaranApi
        .apiPembayaranTransaksiIdGetWithHttpInfo(widget.transaksi.idTransaksi!)
        .then((res) {
      setState(() {
        if (res.statusCode == 200) {
          pembayaran = Pembayaran.fromJson(jsonDecode(res.body));
          _isLoading = false;
          _isFailed = false;
        } else {
          _isLoading = false;
          _isFailed = true;
        }
      });
    });
    // _isFailed = widget.transaksi.status == 'batal';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        color: Colors.white, // Set background to white
        child: const Center(
          child: CircularProgressIndicator(// Progress indicator background
              ),
        ),
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
        title: const Text("Transaction Detail"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [_paymentDetailCard(), const Gap(20), _motorDetailCard()],
          ),
        ),
      ),
    );
  }

  Widget _paymentDetailCard() {
    // if (pembayaran == null) {
    //   return SizedBox(
    //     height: 200,
    //     width: double.infinity,
    //     child: Center(
    //         child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Text("Payment details not found", style: AppTextStyle.body2Regular),
    //         ButtonWidget.primary(label: "Make Payment Now", press: () {})
    //       ],
    //     )),
    //   );
    // }

    return Card(
        elevation: 2,
        color: AppColors.N0,
        child: Padding(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Payment Details", style: AppTextStyle.body2SemiBold),
              ]),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rent Date", style: AppTextStyle.smallReguler),
                  Text(AppUtil.formatDate(widget.transaksi.tanggalMulai!),
                      style: AppTextStyle.body2Regular),
                ],
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rent Duration", style: AppTextStyle.smallReguler),
                  Text(
                    '${widget.transaksi.tanggalSelesai!.difference(widget.transaksi.tanggalMulai!).inDays + 1} Hari',
                    style: AppTextStyle.body2Regular,
                  )
                ],
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Method", style: AppTextStyle.smallReguler),
                  Text(
                      AppUtil.displayEnumValue(
                          pembayaran?.metodePembayaran?.value),
                      style: AppTextStyle.body2Regular),
                ],
              ),
              const Gap(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price", style: AppTextStyle.smallReguler),
                  Text(
                    AppUtil.formatPriceDouble(
                        widget.transaksi.totalHarga ?? 0.0),
                    style: AppTextStyle.body2Regular,
                  ),
                ],
              ),
              const Gap(12),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Status", style: AppTextStyle.smallReguler),
                Text(
                    AppUtil.displayEnumValue(
                        pembayaran?.statusPembayaran?.value),
                    style: AppTextStyle.body2Regular),
                const Gap(12),
                if (pembayaran?.statusPembayaran == StatusPembayaran.belumLunas)
                  ButtonWidget.primary(
                      label: "Pay Now",
                      press: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        await ApiService().pembayaranApi.apiPembayaranIdPut(
                            pembayaran!.idPembayaran!,
                            putPembayaranDTO: PutPembayaranDTO(
                              metodePembayaran: pembayaran!.metodePembayaran,
                              statusPembayaran:
                                  StatusPembayaran.menungguKonfirmasi,
                              tanggalPembayaran: DateTime.now(),
                            ));
                        pembayaran = await ApiService()
                            .pembayaranApi
                            .apiPembayaranIdGet(pembayaran!.idPembayaran!);
                        setState(() {
                          _isLoading = false;
                        });
                      })
              ]),
            ])));
  }

  Widget _motorDetailCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          color: AppColors.N0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Motorcycle Details",
                    style: AppTextStyle.body2SemiBold,
                  ),
                  const Gap(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Police Number', style: AppTextStyle.smallReguler),
                      Text(widget.transaksi.motor!.platNomor!,
                          style: AppTextStyle.body2Regular),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('STNK Number', style: AppTextStyle.smallReguler),
                      Text(widget.transaksi.motor!.nomorSTNK ?? "-",
                          style: AppTextStyle.body2Regular),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Brand', style: AppTextStyle.smallReguler),
                      Text(
                        widget.transaksi.motor!.brand!,
                        style: AppTextStyle.body2Regular,
                      ),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Model', style: AppTextStyle.smallReguler),
                      Text(widget.transaksi.motor!.model!,
                          style: AppTextStyle.body2Regular),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Type', style: AppTextStyle.smallReguler),
                      Text(widget.transaksi.motor!.tipe!,
                          style: AppTextStyle.body2Regular),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tahun', style: AppTextStyle.smallReguler),
                      Text(widget.transaksi.motor!.tahun.toString(),
                          style: AppTextStyle.body2Regular),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transmisi', style: AppTextStyle.smallReguler),
                      Text(
                          widget.transaksi.motor!.transmisi?.value ?? "Unknown",
                          style: AppTextStyle.body2Regular),
                    ],
                  ),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Harga Harian', style: AppTextStyle.smallReguler),
                      Text(
                        '${AppUtil.formatPriceDouble(widget.transaksi.motor!.hargaHarian!)} / Hari',
                        style: AppTextStyle.body2Regular,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
