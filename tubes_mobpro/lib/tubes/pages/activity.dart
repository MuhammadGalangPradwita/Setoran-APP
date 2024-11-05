import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes_mobpro/tubes/pages/detail_activity_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/transaction_card.dart';

List<Map<String, dynamic>> transactionData = const [
  {
    "group": "today",
    "riwayat": [
      {
        "tipe": "NMAX",
        "transmisi": "Matic",
        "date": "26 Oct 2024",
        "price": "50000",
        "orderNumber": "IB00234566",
        "status": "active",
      },
      {
        "tipe": "NMAX",
        "transmisi": "Matic",
        "date": "26 Oct 2024",
        "price": "50000",
        "orderNumber": "IB00234566",
        "status": "failed",
      }
    ]
  },
  {
    "group": "This Week",
    "riwayat": [
      {
        "tipe": "NMAX",
        "transmisi": "Matic",
        "date": "26 Oct 2024",
        "price": "50000",
        "orderNumber": "IB00234566",
        "status": "completed",
      },
      {
        "tipe": "NMAX",
        "transmisi": "Matic",
        "date": "26 Oct 2024",
        "price": "50000",
        "orderNumber": "IB00234566",
        "status": "completed",
      }
    ]
  }
];

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

enum TimeFilter { today, week, month }

class _ActivityPageState extends State<ActivityPage> {
  Map<String, dynamic> _items = {};

  TimeFilter selectedPeriod = TimeFilter.week;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      readJSON();
    });
  }

  TabBar get _tabBar => TabBar(
        tabs: const [
          Tab(
            text: "Today",
          ),
          Tab(
            text: "This Week",
          ),
          Tab(
            text: "This Month",
          ),
        ],
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.G500,
        labelColor: AppColors.B400,
        unselectedLabelColor: AppColors.N700,
        labelStyle: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: AppColors.N0,
          appBar: AppBar(
            // leading: IconButton(
            //     onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: const Text("Activity"),
            backgroundColor: AppColors.B400,
            foregroundColor: AppColors.N0,
            bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: Material(
                  color: AppColors.N0,
                  child: _tabBar,
                )),
          ),
          body: TabBarView(children: [
            todayTab(),
            weekTab(),
            weekTab(),
          ])),
    );
  }

  Future<void> readJSON() async {
    await Future.delayed(Duration.zero);
    final String response =
        await rootBundle.loadString('assets/sampleActivity.json');
    final data = await json.decode(response);
    Future.microtask(() {
      setState(() {
        _items = data;
      });
    });
  }

  Widget todayTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.N800,
                fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items['today']?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailActivityPage(
                          activity: _items['today'][index]);
                    }));
                  },
                  child: TransactionCard(
                    vehicleName: _items['today'][index]["tipe"],
                    transmissionType: _items['today'][index]["transmisi"],
                    date: _items['today'][index]["date"],
                    price: _items['today'][index]["price"],
                    status: _items['today'][index]["status"],
                    orderNumber: _items['today'][index]["orderNumber"],
                    imagePath:
                        'assets/images/${_items['today'][index]["tipe"]}.png',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget weekTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This Week",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.N800,
                fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items['week']?.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailActivityPage(
                          activity: _items['week'][index]);
                    }));
                  },
                  child: TransactionCard(
                    vehicleName: _items['week'][index]["tipe"],
                    transmissionType: _items['week'][index]["transmisi"],
                    date: _items['week'][index]["date"],
                    price: _items['week'][index]["price"],
                    status: _items['week'][index]["status"],
                    orderNumber: _items['week'][index]["orderNumber"],
                    imagePath:
                        'assets/images/${_items['today'][index]["tipe"]}.png',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
