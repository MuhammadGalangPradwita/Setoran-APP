import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
  Motor? motor;
  // Image? image;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    loadMotor();
  }

  Future<void> loadMotor() async {
    // final result = await MotorAPi.getById(widget.transaksi.idMotor);
    setState(() {
      motor = widget.transaksi.motor;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (motor == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Card(
      elevation: 0,
      color: setColor(widget.transaksi.status!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            _buildImage(),
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
                        motor!.model!,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: AppColors.N0,
                            fontWeight: FontWeight.w600),
                      ),
                      const Gap(20),
                      Text(
                        widget.transaksi.idTransaksi.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: AppColors.N0),
                      ),
                    ],
                  ),
                  Text(
                    motor!.transmisi!,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
                  ),
                  Text(
                    // widget.transaksi.tanggalMulai.toString(),
                    AppUtil.formatDate(widget.transaksi.tanggalMulai!),
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
                  ),
                  Text(
                    // 'Rp${formatter.format(widget.transaksi.nominal)}',
                    AppUtil.formatPrice(widget.transaksi.totalHarga! as int),
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
                  ),
                  Text(
                    widget.transaksi.status!,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
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
    if (status == "berlangsung") {
      return AppColors.B400;
    } else if (status == "selesai") {
      return AppColors.G500;
    } else {
      return AppColors.R400;
    }
  }

  Widget _buildImage() {
    if (imagePath != null) {
      return Image(
        image: AssetImage(imagePath!),
        // width: ,
        height: 100,
      );
    } else {
      return SizedBox(
        height: 100,
        width: 100,
      );
    }
  }
}
