import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_utilities/transaksi.dart';
import 'package:tubes_mobpro/tubes/api_utilities/voucher.dart';
import 'package:tubes_mobpro/tubes/models/motor.dart';
import 'package:tubes_mobpro/tubes/models/voucher.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/widgets/selectDatePeroide.dart';

class BookMotorcyclePage extends StatefulWidget {
  final Motor motor;

  const BookMotorcyclePage({super.key, required this.motor});

  @override
  State<BookMotorcyclePage> createState() => _BookMotorcyclePageState();
}

class _BookMotorcyclePageState extends State<BookMotorcyclePage> {
  final formatter = NumberFormat("#,###");

  String? kodeVoucher;
  Voucher? voucher;
  String? paymentMethod;
  DateTimeRange? rentTime;

  String VoucherResultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Motorcycle'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Motorcycle Info
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/NMAX.png', // Replace with your motorcycle image asset path
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16.0),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NMAX',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4.0),
                      Text('Brand: Yamaha', style: TextStyle(fontSize: 14.0)),
                      SizedBox(height: 4.0),
                      Text('Transmission: Matic',
                          style: TextStyle(fontSize: 14.0)),
                    ],
                  ),
                ],
              ),
            ),

            // SizedBox(height: 16.0),

            const Divider(
              height: 50,
            ),

            const SizedBox(height: 16.0),

            // Return Time Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rental duration',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() async {
                      rentTime = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.blue,
                              colorScheme:
                                  const ColorScheme.light(primary: Colors.blue),
                              buttonTheme: const ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary),
                            ),
                            child: child!,
                          );
                        },
                      );
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      rentTime != null
                          ? getDateRange(rentTime!)
                          : 'Pick a Date',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // SizedBox(height: 16.0),
            const Divider(
              height: 50,
            ),

            // Voucher Code
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text Field
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            kodeVoucher = value;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Voucher Code',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    // Button
                    ElevatedButton(
                      onPressed: () async {
                        List<Voucher> voucherList = await VoucherAPi.getAll();

                        setState(() {
                          try {
                            voucher = voucherList.firstWhere(
                                (v) => v.kodeVoucher == kodeVoucher);
                            VoucherResultMessage =
                                'Voucher code "${voucher!.namaVoucher}" applied!';
                          } catch (e) {
                            voucher = null;
                            VoucherResultMessage =
                                'Please enter a valid voucher code.';
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('Apply'),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                // Message Display
                Text(
                  VoucherResultMessage,
                  style: TextStyle(
                    color: kodeVoucher != "" ? Colors.green : Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),

            // SizedBox(height: 16.0),
            const Divider(
              height: 50,
            ),

            // Payment Method
            const Text('Payment Method',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Column(
              children: [
                RadioListTile(
                  title: const Text('Bank Transfer'),
                  value: 'bank_transfer',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text('DANA'),
                  value: 'dana',
                  groupValue: paymentMethod,
                  onChanged: (value) {
                    setState(() {
                      paymentMethod = value;
                    });
                  },
                ),
              ],
            ),

            // const SizedBox(height: 16.0),
            const Divider(
              height: 50,
            ),

            // Amount Details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount', style: TextStyle(fontSize: 14.0)),
                Text('Rp. ${formatter.format(widget.motor.hargaHarian)}',
                    style: const TextStyle(fontSize: 14.0)),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Hours', style: TextStyle(fontSize: 14.0)),
                Text(rentTime != null ? '${rentTime!.duration.inHours}' : '0',
                    style: const TextStyle(fontSize: 14.0)),
              ],
            ),

            const SizedBox(height: 8.0),

            if (voucher != null && rentTime != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Original fees',
                      style: TextStyle(fontSize: 14.0)),
                  Text(
                      'Rp. ${formatter.format(widget.motor.hargaHarian * rentTime!.duration.inHours)}',
                      style: const TextStyle(fontSize: 14.0)),
                ],
              ),

            const SizedBox(height: 8.0),

            if (voucher != null && rentTime != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Voucher', style: TextStyle(fontSize: 14.0)),
                  Text(voucher != null ? '${voucher!.persen}%' : ' - ',
                      style: const TextStyle(fontSize: 14.0)),
                ],
              ),

            // const SizedBox(height: 8.0),
            const Divider(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                Text(
                    rentTime != null
                        ? 'Rp. ${formatter.format(calculateFees(widget.motor, rentTime!, voucher))}'
                        : 'Rp. 0,000',
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 24.0),

            // Rent Now Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // createTransaction(voucherCode, paymentMethod, );

                  if (rentTime != null) {
                    createTransaction(widget.motor, rentTime!, voucher);
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: AppColors.B400),
                child: const Text('Rent Now',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDateRange(DateTimeRange range) {
    String startMonth = DateFormat('MMM').format(range.start);
    String endMonth = DateFormat('MMM').format(range.end);

    String rentRange = "";

    rentRange += "$startMonth ${range.start.day} - ";

    if (range.start.month == range.end.month) {
      rentRange += "${range.end.day}";
    } else {
      rentRange += "$endMonth ${range.end.day}";
    }

    return rentRange;
  }

  void createTransaction(
      Motor motor, DateTimeRange range, Voucher? voucher) async {
    // Calculate the total fees
    double finalFees = calculateFees(motor, range, voucher);

    // Create a payload for the transaction
    Map<String, dynamic> payload = {
      'id_motor': motor.idMotor,
      'id_pelanggan':
          1, // Replace with actual customer ID (e.g., fetched from auth or user context)
      'tanggal_mulai': range.start.toIso8601String(),
      'tanggal_selesai': range.end.toIso8601String(),
      'status_transaksi':
          'dibuat', // Default status when creating a transaction
      'durasi': range.duration.inDays, // Assuming duration is in days
      'nominal': finalFees,
    };

    try {
      // Call API to store the transaction
      var response = await TransaksiAPI.postTransaksi(payload);

      // If successful, show a success message and navigate to home
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Transaction created successfully!')),
      );

      Navigator.of(context).popUntil((route) => route.isFirst);

    } catch (e) {
      // Handle unexpected errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),

      );

      print(e);
    }
  }

  double calculateFees(Motor motor, DateTimeRange range, Voucher? voucher) {
    double fees = motor.hargaHarian * range.duration.inHours;

    if (voucher != null) {
      fees *= ((100 - voucher.persen) / 100);
    }

    return fees;
  }
}
