import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class SearchResultDetail extends StatelessWidget {
  const SearchResultDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Details',
              style: AppTextStyle.body3SemiBold,
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 210,
                height: 184,
                child: Image.asset(
                  'assets/images/NMAX_highRes.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 22, horizontal: 27.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Yamaha, NMAX',
                            style: AppTextStyle.body2SemiBold,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Color(0xFFFFE100),
                                size: 14,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '4.8',
                                style: AppTextStyle.body3SemiBold,
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Matic, 2020',
                        style: AppTextStyle.smallReguler,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Deskripsi',
                        style: AppTextStyle.body3SemiBold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'This motorbike has ample legroom and a comfortable seating position, making it ideal for long-distance travel. The seat is designed with soft padding',
                        style: AppTextStyle.smallReguler,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Spesifikasi',
                        style: AppTextStyle.body3SemiBold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Brand',
                            style: AppTextStyle.smallReguler,
                          ),
                          Text('Yamaha', style: AppTextStyle.smallReguler),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Type',
                            style: AppTextStyle.smallReguler,
                          ),
                          Text('NMAX', style: AppTextStyle.smallReguler),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tahun',
                            style: AppTextStyle.smallReguler,
                          ),
                          Text('2024', style: AppTextStyle.smallReguler),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transmisi',
                            style: AppTextStyle.smallReguler,
                          ),
                          Text('Matic', style: AppTextStyle.smallReguler),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Police Number',
                            style: AppTextStyle.smallReguler,
                          ),
                          Text('D 1234 BKR', style: AppTextStyle.smallReguler),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
