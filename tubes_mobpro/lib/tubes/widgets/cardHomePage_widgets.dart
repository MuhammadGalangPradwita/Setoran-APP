import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/extension/motor.dart';
import 'package:tubes_mobpro/tubes/pages/discount_page.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_detail.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class vehicleCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Motor motor;
  final DateTimeRange? selectedDateRange;
  final List<Ulasan>? ulasan;

  vehicleCard(
      {super.key,
      required this.margin,
      required this.motor,
      required this.ulasan,
      this.selectedDateRange});

  final formatter = NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            color: AppColors.N200,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchResultDetail(
                              motor: motor,
                              selectedDateRange: selectedDateRange,
                            )));
              },
              child: SizedBox(
                width: 165,
                height: 250,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 100,
                        margin: margin,
                        child: Builder(
                          builder: (context) {
                            if (motor.idMotorImage != null) {
                              return Image.network(
                                  "http://160.19.167.222:5103/storage/fetch/${motor.motorImage!.left!}",
                                  fit: BoxFit.fitHeight);
                            } else {
                              return Image.asset(
                                'assets/images/general-img-landscape.png',
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "${motor.model}",
                            textAlign: TextAlign.left,
                            style: AppTextStyle.body1Bold,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(right: 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    motor.ulasan != null &&
                                            motor.getAvgUlasan() != null
                                        ? motor
                                            .getAvgUlasan()!
                                            .toString()
                                            .substring(0, 3)
                                        : "-",
                                    style: AppTextStyle.body2Bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${motor.transmisi}",
                          textAlign: TextAlign.left,
                          style: AppTextStyle.body3Regular,
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            'Rp${formatter.format(motor.hargaHarian) ?? "-"}',
                            textAlign: TextAlign.left,
                            style: AppTextStyle.body1Bold,
                          ),
                          Text(
                            '/day',
                            textAlign: TextAlign.left,
                            style: AppTextStyle.body3Regular,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class vehicleCardDiscount extends StatelessWidget {
  final Motor motor;

  final List<Ulasan>? ulasan;
  final double disPrice;
  final formatter = NumberFormat("#,###");

  vehicleCardDiscount({
    super.key,
    required this.ulasan,
    required this.disPrice,
    required this.motor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Card(
            color: AppColors.N200,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResultDetail(motor: motor),
                  ),
                );
              },
              child: SizedBox(
                width: 180,
                height: 250,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Builder(
                        builder: (context) {
                          if (motor.idMotorImage != null) {
                            return Image.network(
                              "http://160.19.167.222:5103/storage/fetch/${motor.motorImage!.front!}",
                              fit: BoxFit.fitHeight,
                            );
                          } else {
                            return Image.asset(
                              'assets/images/general-img-landscape.png',
                              fit: BoxFit.cover,
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "${motor.model}",
                            textAlign: TextAlign.left,
                            style: AppTextStyle.body1Bold,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(right: 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    ulasan != null &&
                                            Motor().calculateAverageRating(
                                                    ulasan!) !=
                                                null
                                        ? Motor()
                                            .calculateAverageRating(ulasan!)!
                                            .toStringAsFixed(1)
                                        : "-",
                                    style: AppTextStyle.body2Bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${motor.transmisi}",
                          textAlign: TextAlign.left,
                          style: AppTextStyle.body3Regular,
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            'Rp${formatter.format(disPrice) ?? "-"}',
                            textAlign: TextAlign.left,
                            style: AppTextStyle.body1Bold
                                .copyWith(color: AppColors.R400),
                          ),
                          Text(
                            '/day',
                            textAlign: TextAlign.left,
                            style: AppTextStyle.body3Regular,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        'Rp${formatter.format(motor.hargaHarian) ?? "-"}',
                        textAlign: TextAlign.left,
                        style: AppTextStyle.body3Regular.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VoucherCard extends StatelessWidget {
  const VoucherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Voucher',
                    style: AppTextStyle.body2Bold,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DiscountPage(),
                                ),
                              );
                            },
                            child: Text(
                              "More",
                              style: AppTextStyle.body3Regular,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 0,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        children: [
                          Text(
                            'New Member',
                            style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'SALE',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.blue,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                              height: 57,
                              width: 75,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/voucher-discount.png')))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 189,
                        height: 115,
                      ),
                      const Positioned(
                        top: -10,
                        right: 0,
                        child: SizedBox(
                            width: 189,
                            height: 115,
                            child: Image(
                                image:
                                    AssetImage('assets/images/voucher.png'))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
