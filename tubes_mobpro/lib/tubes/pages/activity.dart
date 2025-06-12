import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
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
  // Penggantian setelah perubahan enum
  StatusTransaksi? status; // Default status

  // Define available status options
  final List<Map<String, String>> statusOptions = [
    {'value': '', 'label': 'Semua'},
    {'value': 'Selesai', 'label': 'Selesai'},
    {'value': 'Dibuat', 'label': 'Dibuat'},
    {'value': 'Berlangsung', 'label': 'Berlangsung'},
    {'value': 'Bata;', 'label': 'Batal'},
    // Add more status options as needed
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      dataList = ApiService().transaksiApi.apiTransaksiGet(
          idPelanggan: Provider.of<AuthState>(context, listen: false)
              .currentUser!
              .pelanggan!
              .idPelanggan!
              .toString(),
          status: status);
    });
  }

  void _onStatusChanged(String? newStatus) {
    if (newStatus != null && newStatus != status) {
      setState(() {
        if (newStatus.isEmpty) {
          status = null; // Reset to default (all statuses)
        } else {
          status = StatusTransaksi.fromJson(newStatus);
        }
      });
      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        title: const Text("Activity"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Column(
        children: [
          // Status Filter Dropdown
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.N0,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.filter_list,
                  color: AppColors.B400,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Filter by Status:",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.B400,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.B400.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.N0,
                        value: status?.value ?? '',
                        isExpanded: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.B400,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppColors.B400,
                        ),
                        items: statusOptions.map((Map<String, String> option) {
                          return DropdownMenuItem<String>(
                            value: option['value'],
                            child: Text(option['label']!),
                          );
                        }).toList(),
                        onChanged: _onStatusChanged,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder<List<Transaksi>?>(
                future: dataList,
                builder: (context, snapshot) {
                  // Debug prints - remove these in production
                  print("ConnectionState: ${snapshot.connectionState}");
                  print("HasData: ${snapshot.hasData}");
                  print("HasError: ${snapshot.hasError}");
                  print("Data: ${snapshot.data}");

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    print("___Error: ${snapshot.error}");
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 48,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Error: ${snapshot.error}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: _loadData,
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    return _buildContent(snapshot.data!);
                  }

                  // This handles the case where there's no data but no error
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.inbox_outlined,
                          size: 48,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No Data Available",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _loadData,
                          child: const Text("Refresh"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(List<Transaksi> data) {
    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.assignment_outlined,
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              "No transactions found",
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "for status: ${statusOptions.firstWhere((option) => option['value'] == status)['label']}",
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text("Refresh"),
            ),
          ],
        ),
      );
    }
    data.sort((a, b) => b.idTransaksi!.compareTo(a.idTransaksi!));
    return RefreshIndicator(
      onRefresh: () async {
        _loadData();
        await dataList;
      },
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final transaksi = data[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: DetailActivityPage(
                    transaksi: transaksi,
                  ),
                  withNavBar: false,
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return DetailActivityPage(
                //     transaksi: transaksi,
                //   );
                // }));
              },
              borderRadius: BorderRadius.circular(8),
              child: TransactionCard(
                transaksi: transaksi,
              ),
            ),
          );
        },
      ),
    );
  }
}
