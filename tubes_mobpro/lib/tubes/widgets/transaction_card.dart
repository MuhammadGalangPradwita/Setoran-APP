import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class TransactionCard extends StatelessWidget {
  final String vehicleName;
  final String transmissionType;
  final String date;
  final String price;
  final String status;
  final String orderNumber;
  final Color? color;
  final String imagePath;

  const TransactionCard(
      {super.key,
      required this.vehicleName,
      required this.transmissionType,
      required this.date,
      required this.price,
      required this.status,
      required this.orderNumber,
      required this.imagePath,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: setColor(status),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image(
              image: AssetImage(imagePath),
              // width: ,
              height: 100,
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
                        vehicleName,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: AppColors.N0,
                            fontWeight: FontWeight.w600),
                      ),
                      const Gap(20),
                      Text(
                        orderNumber,
                        style: GoogleFonts.poppins(
                            fontSize: 10, color: AppColors.N0),
                      ),
                    ],
                  ),
                  Text(
                    transmissionType,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
                  ),
                  Text(
                    date,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
                  ),
                  Text(
                    price,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: AppColors.N0),
                  ),
                  Text(
                    status,
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
    if (status == "active") {
      return AppColors.B400;
    } else if (status == "completed") {
      return AppColors.G500;
    } else {
      return AppColors.R400;
    }
  }
}
