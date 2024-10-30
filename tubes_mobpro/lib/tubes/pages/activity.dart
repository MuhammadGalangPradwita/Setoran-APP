import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

enum TimeFilter { today, week, month }

class _ActivityState extends State<Activity> {
  TimeFilter selectedPeriod = TimeFilter.week;

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
          body: const TabBarView(children: [
            TodayTabPage(),
            WeekTabPage(),
            TodayTabPage(),
          ])),
    );
  }
}

class TodayTabPage extends StatelessWidget {
  const TodayTabPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: transactionData[0]["riwayat"]!.length,
              itemBuilder: (context, index) {
                return TransactionCard(
                    vehicleName: transactionData[0]["riwayat"][index]["tipe"],
                    transmissionType: transactionData[0]["riwayat"][index]
                        ["transmisi"],
                    date: transactionData[0]["riwayat"][index]["date"],
                    price: transactionData[0]["riwayat"][index]["price"],
                    status: transactionData[0]["riwayat"][index]["status"],
                    orderNumber: transactionData[0]["riwayat"][index]
                        ["orderNumber"]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class WeekTabPage extends StatelessWidget {
  const WeekTabPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: transactionData[1]["riwayat"]!.length,
              itemBuilder: (context, index) {
                return TransactionCard(
                    vehicleName: transactionData[1]["riwayat"][index]["tipe"],
                    transmissionType: transactionData[1]["riwayat"][index]
                        ["transmisi"],
                    date: transactionData[1]["riwayat"][index]["date"],
                    price: transactionData[1]["riwayat"][index]["price"],
                    status: transactionData[1]["riwayat"][index]["status"],
                    orderNumber: transactionData[1]["riwayat"][index]
                        ["orderNumber"]);
              },
            ),
          )
        ],
      ),
    );
  }
}
