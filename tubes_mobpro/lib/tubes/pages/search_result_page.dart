import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tubes_mobpro/tubes/pages/search_result_detail.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yamaha, NMAX',
                style: AppTextStyle.body3SemiBold,
              ),
              Text(
                'Sun, 26 Oct 2024 ',
                style: AppTextStyle.smallReguler,
              )
            ],
          ),
          backgroundColor: AppColors.B400,
          foregroundColor: AppColors.N0,
        ),
        body: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 27.5),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 17,
                      crossAxisSpacing: 12),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return const SearchResultCard();
                  })),
        ));
  }
}

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SearchResultDetail();
        }));
      },
      child: Container(
        width: 144,
        height: 173,
        decoration: const BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          child: Column(
            children: [
              Image.asset(
                'assets/images/NMAX.png',
                width: 104.69,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NMAX', style: AppTextStyle.body3SemiBold),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Color(0xFFFFE100),
                            size: 10,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '4.8',
                            style: GoogleFonts.poppins(
                                fontSize: 8, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Transmission: ',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Matic',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Rp. 50.000,00', style: AppTextStyle.smallSemiBold),
                      Text('/day',
                          style: GoogleFonts.poppins(
                            fontSize: 8, // Smaller font for "/day"
                            fontWeight: FontWeight.normal,
                          ))
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
