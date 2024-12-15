import 'package:flutter/material.dart';
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
              margin: const EdgeInsets.only(left: 20),
              color: AppColors.N200 ,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: (){

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
                            
                            const SizedBox(width: 85),  
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
              margin: margin,
              color: AppColors.N200 ,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: (){

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
                            
                            const SizedBox(width: 85),  
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

