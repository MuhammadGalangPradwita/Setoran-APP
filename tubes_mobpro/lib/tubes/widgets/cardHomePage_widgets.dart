import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/pages/search_result_detail.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/textField_widget.dart';

class vehicleCard extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final String imagePath;
  final String vehicleName;
  final String rating;
  final String transmition;
  final String price;
  
  const vehicleCard(
      {super.key,
      required this.width,
      required this.height,
      required this.margin,
      required this.imagePath,
      required this.vehicleName,
      required this.rating,
      required this.transmition,
      required this.price
      }
    );

    // // NMAX normal price:
    // height: 260,
    // width: 200,
    // margin: const EdgeInsets.only(top: 20,right: 20,left: 20),
    // beat margin: top: 20,right: 5,left: 5
    // imagePath: "assets/images/NMAX_highRes.png",
    // vehicleName: 'NMAX',
    // rating: '4.8',
    // transmition: 'Transmision: Matic',
    // price: 'Rp. 30.000,00',

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.only(left: 20,top: 10),
              color: AppColors.N200 ,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResultDetail()
                          )
                  );
                },
                child: SizedBox(
                  width:width,
                  height: height,
                  child: Column(
                    children: [
                      Container(
                        margin: margin,
                        child:Image.asset(imagePath)
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              vehicleName,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.body2Bold,
                            ),
                            
                            const SizedBox(width: 48),  
                            const Icon(
                              Icons.star,
                              color: Colors.amber,  
                              size: 18,  
                            ),

                            const SizedBox(width: 5),  
                            Text(
                              rating,
                              style: TextStyle(
                                fontSize: 16,  
                                color: Colors.black,  
                              ),
                            ),
                          ],
                        ),
                      ),
            
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          transmition,
                        textAlign: TextAlign.left,
                        style: AppTextStyle.body3Regular,)
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                             Text(
                              price,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.body2Bold,
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
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final String imagePath;
  final String vehicleName;
  final String rating;
  final String transmition;
  final String disPrice;
  final String norPrice;
  
  const vehicleCardDiscount(
    {super.key,
    required this.width,
    required this.height,
    required this.margin,
    required this.imagePath,
    required this.vehicleName,
    required this.rating,
    required this.transmition,
    required this.disPrice,
    required this.norPrice,
    }
    );

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.only(left: 20,top: 10),
              color: AppColors.N200 ,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: (){
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchResultDetail()
                          )
                  );
                },
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Column(
                    children: [
                      Container(
                        margin: margin,
                        child:  Image.asset(imagePath),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Text(
                              vehicleName,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.body2Bold,
                            ),
                            
                            const SizedBox(width: 48),  
                            const Icon(
                              Icons.star,
                              color: Colors.amber,  
                              size: 18,  
                            ),

                            const SizedBox(width: 5),  
                            Text(
                              rating,  
                              style: TextStyle(
                                fontSize: 16,  
                                color: Colors.black,  
                              ),
                            ),
                          ],
                        ),
                      ),
            
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(
                          transmition, 
                        textAlign: TextAlign.left,
                        style: AppTextStyle.body3Regular,)
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                             Text(
                              disPrice,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.body2Bold.copyWith(color:AppColors.R400),
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
                          norPrice,
                              textAlign: TextAlign.left,
                              style: AppTextStyle.body3Regular.copyWith(decoration: TextDecoration.lineThrough),
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
                        child: Text('Voucher',
                        style:AppTextStyle.body2Bold,),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: TextButton(
                                  onPressed: (){}, 
                                  child: Text("More",
                                  style: AppTextStyle.body3Regular,)),
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
                            flex:2,
                            child: Container(
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1), // Shadow color
                                      offset: const Offset(4, 4), // Position of shadow
                                      blurRadius: 10, // Blur effect of shadow
                                      spreadRadius: 2, // Spread effect of shadow
                                    ),
                                  ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7),
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
                                      const SizedBox(height:57, width: 75,child:  Image(image: AssetImage('assets/images/voucher-discount.png')))
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
                                    child: Image(image: AssetImage('assets/images/voucher.png'))),
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

