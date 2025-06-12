import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';

class TransactionCard extends StatefulWidget {
  final Transaksi transaksi;

  const TransactionCard({super.key, required this.transaksi});

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  // Motor? motor;
  // Image? image;
  // String? imagePath;
  Pembayaran? pembayaran;

  @override
  void initState() {
    super.initState();
    if (widget.transaksi.status == StatusTransaksi.dibuat) {
      ApiService()
          .pembayaranApi
          .apiPembayaranTransaksiIdGet(widget.transaksi.idTransaksi!)
          .then((value) {
        setState(() {
          pembayaran = value;
        });
      });
    }
  }

  // Future<void> loadMotor() async {
  //   // final result = await MotorAPi.getById(widget.transaksi.idMotor);
  //   setState(() {
  //     motor = widget.transaksi.motor;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.transaksi.motor == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Card(
      color: AppColors.N0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width: 320 / 3,
              height: 70,
              child: FutureBuilder(
                future: _buildImage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return const Text('Error loading image');
                  } else if (snapshot.hasData) {
                    return snapshot.data!;
                  } else {
                    return const Text('No image available');
                  }
                },
              ),
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.transaksi.motor!.model!,
                        style: AppTextStyle.body2SemiBold,
                      ),
// <<<<<<< main
                      // const Gap(20),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     // Penggantian setelah perubahan enum
                      //     color: setColor(
                      //         widget.transaksi.status!.value.toString()),
                      //     borderRadius: BorderRadius.circular(4),
                      //   ),
                      //   // color: setColor(widget.transaksi.status!),
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 8, vertical: 4),
                      //   child: Text(
                      //     // Penggantian setelah perubahan enum
                      //     widget.transaksi.status!.value.toString(),
                      //     style: AppTextStyle.smallReguler.copyWith(
                      //       color: AppColors.N0,
// =======
                      const Gap(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Builder(builder: (context) {
                            if (pembayaran != null) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    AppUtil.displayEnumValue(
                                        pembayaran!.statusPembayaran!.value),
                                    style: AppTextStyle.smallReguler.copyWith(
                                      color: AppColors.N600,
                                    ),
                                  ),
                                  const Gap(4),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                          Container(
                            decoration: BoxDecoration(
                              color: setColor(widget.transaksi.status!.value),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            // color: setColor(widget.transaksi.status!),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Text(
                              widget.transaksi.status!.value,
                              style: AppTextStyle.smallReguler.copyWith(
                                color: AppColors.N0,
                              ),
                            ),
// >>>>>>> safwan
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    widget.transaksi.motor!.brand!,
                    style: AppTextStyle.body3Regular.copyWith(
                      color: AppColors.N600,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 12,
                          ),
                          const Gap(4),
                          Text(
                            // widget.transaksi.tanggalMulai.toString(),
                            AppUtil.formatDate(widget.transaksi.tanggalMulai!),
                            style: AppTextStyle.body3Regular,
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.money,
                            size: 12,
                          ),
                          const Gap(4),
                          Text(
                            // 'Rp${formatter.format(widget.transaksi.nominal)}',
                            AppUtil.formatPriceDouble(
                                widget.transaksi.totalHarga!),
                            style: AppTextStyle.body3Regular,
                          ),
                        ],
                      ),
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

  Color setColor(String status) {
    if (status == "Berlangsung") {
      return AppColors.B400;
    } else if (status == "Selesai") {
      return AppColors.G500;
    } else if (status == "Batal") {
      return AppColors.R400;
    } else {
      return AppColors.N700;
    }
  }

  Future<Widget> _buildImage() async {
    String url;
    if (widget.transaksi.motor!.idMotorImage != null) {
      MotorImage? motorImage = await ApiService()
          .motorImageApi
          .apiMotorImageIdGet(widget.transaksi.motor!.idMotorImage!);
      url = "http://160.19.167.222:5103/storage/fetch/${motorImage!.left}";
      return Image.network(
        url,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/images/general-img-landscape.png",
        fit: BoxFit.cover,
      );
    }
  }
}
