import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
  DiscountPage({super.key});

  final PanelController slidingPanelController = PanelController();

  @override
  Widget build(BuildContext context) {
    List<Widget> discountsCards = [];
    for (final discount in discounts) {
      discountsCards.add(
        DiscountCard(
          title: discount['title'],
          code: discount['code'],
          description: discount['description'],
          slidingPanelController: slidingPanelController,
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
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4)
        ),
        color: Color.fromARGB(255, 217, 217, 217),
        controller: slidingPanelController,
        panel: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(8),
                Center(
                  child: Container(
                    height: 4,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 126, 126, 126),
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                  ),
                ),
                // icon atas slide up panel belum
                Gap(8),
                Center(
                  child: Text(
                    'Terms and Conditions',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.N800,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Gap(8),
                // Discount Information
                _partiallyBoldText(
                  '• Discount Rp 20.000,00 ',
                  'with a minimum transaction of IDR 60,000.00',
                ),
                // SizedBox(height: 8),
                // New users information
                _partiallyBoldText(
                  '• Especially for new users',
                  '',
                ),
                // SizedBox(height: 8),
                // Period discount
                _partiallyBoldText(
                  '• Period Discount: ',
                  '26 - 31 Oct 2024',
                ),
                // SizedBox(height: 8),
                // Motorcycle type
                _partiallyBoldText(
                  '• Motorcycle Type: ',
                  'All type of Motorcycle',
                ),
                // SizedBox(height: 16),
                // Voucher Use Procedures title
                _partiallyBoldText(
                  '• Voucher Use Procedures:',
                  '',
                ),
                // SizedBox(height: 8),
                // Procedure steps with bold sections
                _partiallyBoldText(
                  '1. Select Motorbike: ',
                  'Search and select the motorbike you want to rent.',
                  addedIndent: 16
                ),
                _partiallyBoldText(
                  '2. Select Rental Duration: ',
                  'Determine the desired rental date and time.',
                  addedIndent: 16
                ),
                _partiallyBoldText(
                  '3. Enter Order Details: ',
                  'Fill in all the required information, such as name, phone number, and pick-up location.',
                  addedIndent: 16
                ),
                _partiallyBoldText(
                  '4. Enter Voucher Code: ',
                  'Find the column to enter the voucher code when placing an order.',
                  addedIndent: 16
                ),
                _partiallyBoldText(
                  '5. Discount Verification: ',
                  'Check that the discount from the voucher has been applied to the total rental cost before proceeding.',
                  addedIndent: 16
                ),
                _partiallyBoldText(
                  '6. Select Payment Method: ',
                  'Select your desired payment method.',
                  addedIndent: 16
                ),
                _partiallyBoldText(
                  '7. Order Confirmation: ',
                  'Review all order details and ensure they are correct, then confirm order.',
                  addedIndent: 16
                ),
              ],
          ),
        ),
        minHeight: 0,
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
      ),
    );
  }

  // Helper widget for procedure steps with bold section
  Widget _partiallyBoldText(String boldText, String regularText, {double addedIndent=0}) {
    var _indent = addedIndent;
    return Padding(
      // padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      padding: EdgeInsets.only(left: 8 + _indent, right: 8, top: 8, bottom: 8),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: boldText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          children: [
            TextSpan(
              text: regularText,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountCard extends Card {
  const DiscountCard({super.key, this.title='Diskon', this.code='SALECODE', this.description='Valid', this.slidingPanelController});

  final String title;
  final String code;
  final String description;
  final PanelController? slidingPanelController;

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
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 217, 217, 217),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))
                ),
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
                              Spacer(), // gak tau biar container width fill parent gimana
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
                        onTap: () {
                          slidingPanelController!.open();
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

