import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/pages/auth_check.dart';
import 'package:tubes_mobpro/tubes/pages/detail_activity_page.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/transaction_card.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late Future<List<Transaksi>?> dataList;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // readJSON();
    //   fetchData();
    // });
    dataList = fetchData();
  }

  TabBar get _tabBar => TabBar(
        tabs: const [
          Tab(
            text: "Last Week",
          ),
          Tab(
            text: "Last Month",
          ),
          Tab(
            text: "Earlier",
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
            body: FutureBuilder(
              future: dataList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  }
                  if (snapshot.hasData) {
                    return _buildContent(snapshot.data as List<Transaksi>);
                  }
                }
                return const Center(
                  child: Text("No Data"),
                );
              },
            )));
  }

  Widget _buildContent(List<Transaksi> data) {
    return TabBarView(
        children: [lastWeekTab(data), lastMonthTab(data), earlierTab(data)]);
  }

  Future<List<Transaksi>?> fetchData() async {
    // Pelanggan? pel = await PelangganApi.getCurrentPelanggan(
    //     Provider.of<AuthState>(context, listen: false).currentUser!.id);
    // print(pel!.id);
    // return TransaksiApi.getByPelanggan(pel.id);
    final response = await TransaksiApi().apiTransaksiGetWithHttpInfo(query: {
      "IdPelanggan":
          Provider.of<AuthState>(context, listen: false).currentUser!.id
    });

    return jsonDecode(response.body)
        .map((transaksi) => Transaksi.fromJson(transaksi))
        .toList();
  }

  Widget lastWeekTab(List<Transaksi> data) {
    //filter last week
    DateTime now = DateTime.now();
    DateTime lastWeek = DateTime(now.year, now.month, now.day - 7);
    // List<Transaksi> lastWeekData = data.where((element) {
    //   return element.createdAt.isAfter(lastWeek);
    // }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // child: _buildTabContent(lastWeekData),
            child: _buildTabContent(data),
          ),
        ],
      ),
    );
  }

  Widget lastMonthTab(List<Transaksi> data) {
    //filter between last 30 day and last 7 day
    DateTime now = DateTime.now();
    DateTime lastMonth = DateTime(now.year, now.month, now.day - 30);
    DateTime lastWeek = DateTime(now.year, now.month, now.day - 7);

    // List<Transaksi> lastMonthData = data.where((element) {
    //   return element.createdAt.isAfter(lastMonth) &&
    //       element.createdAt.isBefore(lastWeek);
    // }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            // child: _buildTabContent(lastMonthData),
            child: _buildTabContent(data),
          )
        ],
      ),
    );
  }

  Widget earlierTab(List<Transaksi> data) {
    //filter last week
    DateTime now = DateTime.now();
    DateTime lastMonth = DateTime(now.year, now.month, now.day - 30);
    // List<Transaksi> earlierData = data.where((element) {
    //   return element.createdAt.isBefore(lastMonth);
    // }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Expanded(child: _buildTabContent(data))],
      ),
    );
  }

  Widget _buildTabContent(List<Transaksi> data) {
    if (data.isEmpty) {
      return const Center(
        child: Text("No Data"),
      );
    }
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailActivityPage(
                transaksi: data[index],
              );
            }));
          },
          child: TransactionCard(
            transaksi: data[index],
          ),
        );
      },
    );
  }
}
