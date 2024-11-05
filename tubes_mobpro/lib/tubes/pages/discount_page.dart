import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

List<Map<String, dynamic>> discounts = [
  {
    'title': 'Diskon Rp 20rb',
    'code': 'SENINSALE',
    'description': 'Only valid for motorbike rental on Monday'
  },
  {
    'title': 'Diskon Rp 20rb',
    'code': 'SENINSALE',
    'description': 'Only valid for motorbike rental on Monday'
  },
  {
    'title': 'Diskon Rp 20rb',
    'code': 'SENINSALE',
    'description': 'Only valid for motorbike rental on Monday'
  }
];

class DiscountPage extends StatelessWidget {
  const DiscountPage({super.key});



  @override
  Widget build(BuildContext context) {
    List<Widget> discountsCards = [];
    for (final discount in discounts) {
      discountsCards.add(
        DiscountCard(
          title: discount['title'],
          code: discount['code'],
          description: discount['description'],
        )
      );
      discountsCards.add(
        Gap(8)
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Discount"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 235, 235, 235),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Voucher",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.N800,
                      fontWeight: FontWeight.w600),
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
                          flex:2,
                          child: Container(
                            // color: Colors.white,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Column(
                                children: [
                                    Text('New Member',style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    Text('SALE',style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height:57, width: 75,child:  Image(image: AssetImage('assets/images/voucher-discount.png')))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                                Container(  
                                width: 189,
                                height: 115,
                              ),
                              Positioned(
                                top: -10,
                                right: 0,
                                child: SizedBox(
                                  width: 189,
                                  height: 115,
                                  child: Image(image: AssetImage('assets/images/voucher.png'))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(10),
                Text(
                  "Discount Code",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.N800,
                      fontWeight: FontWeight.w600),
                ),
                Gap(10),
                ...discountsCards
              ],
            ),
          ),
        )
      ),
    );
  }
}

class DiscountCard extends Card {
  const DiscountCard({super.key, this.title='Diskon', this.code='SALECODE', this.description='Valid'});

  final String title;
  final String code;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4)
                  )
              ),
            ),
            Container(
              color: Color.fromARGB(255, 217, 217, 217),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.title,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColors.N800,
                          fontWeight: FontWeight.w600),
                    ),
                    Gap(8),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.N400,
                        borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Text(
                              this.code,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors.N800,
                                  fontWeight: FontWeight.w600),
                            ),
                            // Spacer(),
                            Gap(140), // gak tau biar container width fill parent gimana
                            InkWell(
                              child: Text(
                                'Copy',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Gap(8),
                    Text(
                      this.description,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: AppColors.N800,
                          fontWeight: FontWeight.w400),
                    ),
                    Gap(8),
                    InkWell(
                      child: Text(
                        'Terms and Conditions',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}