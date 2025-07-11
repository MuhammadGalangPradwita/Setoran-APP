import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tubes_mobpro/tubes/api_service.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/extension/motor.dart';
import 'package:tubes_mobpro/tubes/pages/homePage_screen.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

import '../widgets/button_widgets.dart';

class BookMotorcyclePage extends StatefulWidget {
  final Motor motor;
  final DateTimeRange? selectedDateRange;

  const BookMotorcyclePage(
      {super.key, required this.motor, this.selectedDateRange});

  @override
  State<BookMotorcyclePage> createState() => _BookMotorcyclePageState();
}

class _BookMotorcyclePageState extends State<BookMotorcyclePage> {
  final formatter = NumberFormat("#,###");

  String? kodeVoucher;
  Voucher? voucher;
  Diskon? diskon;
  MetodePembayaran? paymentMethod;
  DateTimeRange? rentTime;

  bool isLoading = false;

  String VoucherResultMessage = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      diskon = widget.motor.getBestDiscount();
      rentTime = widget.selectedDateRange;
    });
  }

  // Mendapatkan String Rentang Waktu peminjaman motor
  // Jika tgl awal dan akhir di bulan yg sama, maka hanya akan dikeluarkan bulan awal.
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
    double finalFees = calculateFees(motor, range, voucher, diskon);

    setState(() {
      isLoading = true;
    });

    try {
      int? userId =
          (await ApiService().penggunaApi.penggunaCurrentPenggunaGet())!
              .pelanggan
              ?.idPelanggan;

      Map<String, dynamic> payload = {
        'id_motor': motor.idMotor,
        'id_pelanggan': userId,
        'tanggal_mulai': range.start,
        'tanggal_selesai': range.end,
        'status_transaksi': 'dibuat',
        'durasi': range.duration.inDays,
        'nominal': finalFees,
      };

      print('User: ${userId}');

      if (voucher != null) {
        payload['id_voucher'] = voucher.idVoucher;
      }

      if (motor.diskon != null && motor.diskon!.isNotEmpty) {
        payload['id_diskon'] = motor.getBestDiscount()?.idDiskon;
      }

      await ApiService().transaksiApi.apiTransaksiPost(
              postTransaksiDTO: PostTransaksiDTO(
            idMotor: payload['id_motor'],
            idPelanggan: payload['id_pelanggan'],
            tanggalMulai: payload['tanggal_mulai'],
            tanggalSelesai: payload['tanggal_selesai'],
            idVoucher: payload['id_voucher'] ?? null,
            idDiscount: payload['id_diskon'] ?? null,
            metodePembayaran: paymentMethod == 'bank_transfer'
                ? MetodePembayaran.transferBank
                : MetodePembayaran.dompetDigital,
          ));

      await ApiService().motorApi.apiMotorIdPut(payload['id_motor'],
          putMotorDTO: PutMotorDTO(
            statusMotor: StatusMotor.disewa,
            platNomor: motor.platNomor!.replaceAll(' ', ''),
            nomorSTNK: motor.nomorSTNK!,
            nomorBPKB: motor.nomorBPKB!,
            model: motor.model!,
            brand: motor.brand!,
            tipe: motor.tipe!,
            tahun: motor.tahun!,
            transmisi: motor.transmisi!,
            hargaHarian: motor.hargaHarian!,
          ));

      //  Untuk debugging
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.success,
      //   headerAnimationLoop: false,
      //   animType: AnimType.bottomSlide,
      //   title: 'Sukses',
      //   desc: 'idMotor: ${motor.idMotor}\n'
      //       'TipeMotor: ${motor.tipe}\n'
      //       'idPelanggan: ${payload['id_pelanggan']}\n'
      //       'Tanggal Mulai: ${range.start}\n'
      //       'Tanggal Selesai: ${range.end}\n'
      //       'Total Biaya: Rp. ${formatter.format(finalFees)}\n'
      //       'namaVoucher: ${voucher != null ? voucher!.namaVoucher : 'Tidak ada'}\n'
      //       'voucher: ${voucher != null ? voucher!.namaVoucher : 'Tidak ada'}'
      //       'diskon: ${payload['id_diskon'] ?? 'Tidak ada'}',
      //   buttonsTextStyle: const TextStyle(color: Colors.black),
      //   showCloseIcon: false,
      //   // btnCancelOnPress: () {},
      //   // btnOkOnPress: () {
      //   //   Navigator.of(context).popUntil((route) => route.isFirst);
      //   // },
      // ).show();

      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        title: 'Sukses',
        desc: 'Transaksi Berhasil',
        buttonsTextStyle: const TextStyle(color: Colors.black),
        showCloseIcon: false,
        // btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomepageScreen()),
          );
        },
      ).show();
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        title: 'Error!',
        desc: 'Gagal membuat transaksi:\n$e',
        btnOkOnPress: () {},
      ).show();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  double calculateFees(
      Motor motor, DateTimeRange range, Voucher? voucher, Diskon? diskon) {
    double fees = motor.hargaHarian! * range.duration.inDays;

    if (diskon != null) {
      fees -= diskon.jumlahDiskon!;
    }

    if (voucher != null) {
      fees *= ((100 - voucher.persenVoucher!) / 100);
    }

    return fees;
  }

  void checkVoucher() async {
    try {
      var voucherFound =
          await ApiService().voucherApi.voucherGetByCodeCodeGet(kodeVoucher!);

      var voucherUsed = await ApiService()
          .voucherApi
          .voucherCheckVoucherCodeGet(voucherFound!.kodeVoucher!);

      if (voucherFound.statusVoucher!.value == StatusVoucher.nonAktif) {
        VoucherResultMessage = 'Voucher tidak aktik!';
      }

      if (!voucherUsed!.valid! == false) {
        setState(() {
          voucher = voucherFound;

          VoucherResultMessage =
              'Voucher code "${voucher!.namaVoucher}" applied!';
        });
      } else {
        print('vocher found: ${voucherFound}');
        print('vocher used: ${voucherUsed}');
        setState(() {
          voucher = null;

          VoucherResultMessage = 'Anda sudah menggunakan voucher ini!';
        });
      }
    } catch (e) {
      setState(() {
        voucher = null;
        VoucherResultMessage = 'Please enter a valid voucher code.';
      });

      print('Error checking voucher: ${e.toString()}');
    }
  }

  void validateData() {
    if (rentTime != null && paymentMethod != null) {
      createTransaction(widget.motor, rentTime!, voucher);
    } else {
      if (rentTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Rentang waktu belum di isi!')),
        );
      }
      if (paymentMethod == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Metode pembayaran belum di isi!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                // Motorcycle Info \\
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Builder(
                            builder: (context) {
                              final frontImage = widget.motor.motorImage?.front;
                              if (frontImage != null && frontImage.isNotEmpty) {
                                return Image.network(
                                  "http://160.19.167.222:5103/storage/fetch/$frontImage",
                                  height: 80,
                                  width: 120,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                return Image.asset(
                                  'assets/images/general-img-landscape.png',
                                  height: 80,
                                  width: 120,
                                  fit: BoxFit.cover,
                                );
                              }
                            },
                          ),
                        ),

                        const SizedBox(width: 16),

                        // Card detail
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.motor.model}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('Brand: ${widget.motor.brand}'),
                            Text('Transmission: ${widget.motor.transmisi}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // SizedBox(height: 16.0),
                const Divider(
                  height: 50,
                ),

                // Return Time Section \\
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Rental duration',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),

                    // Return time button
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(color: Colors.grey),
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () async {
                        final selectedRange = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: Colors.blue,
                                colorScheme: const ColorScheme.light(
                                    primary: Colors.blue),
                                buttonTheme: const ButtonThemeData(
                                  textTheme: ButtonTextTheme.primary,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );

                        if (selectedRange != null) {
                          setState(() {
                            rentTime = selectedRange;
                          });
                        }
                      },
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
                  ],
                ),

                const Divider(
                  height: 50,
                ),

                // Voucher Code Section \\
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Voucher Code Textfield
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

                        // Voucher Code Button
                        ButtonWidget.secondary(
                            label: "Apply",
                            press: () async {
                              checkVoucher();
                            }),
                      ],
                    ),

                    const SizedBox(height: 8.0),

                    // Voucher Code Result Display
                    Text(
                      VoucherResultMessage,
                      style: TextStyle(
                        color: voucher != null ? Colors.green : Colors.red,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),

                const Divider(
                  height: 50,
                ),

                // Payment Method Section \\

                // Payment Method Label
                const Text('Payment Method',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Column(
                  children: [
                    // Payment Method Options
                    RadioListTile(
                      title: const Text('Bank Transfer'),
                      value: MetodePembayaran.transferBank,
                      groupValue: paymentMethod,
                      onChanged: (value) {
                        setState(() {
                          paymentMethod = value;
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('DANA'),
                      value: MetodePembayaran.dompetDigital,
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

                // Amount Details \\

                // Motor Harga Harian
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Amount', style: TextStyle(fontSize: 14.0)),
                    Text('Rp. ${formatter.format(widget.motor.hargaHarian)}',
                        style: const TextStyle(fontSize: 14.0)),
                  ],
                ),

                const SizedBox(height: 8.0),

                // Motor Total Rentime
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Days', style: TextStyle(fontSize: 14.0)),
                    Text(
                        rentTime != null ? '${rentTime!.duration.inDays}' : '-',
                        style: const TextStyle(fontSize: 14.0)),
                  ],
                ),

                const SizedBox(height: 8.0),

                // Motor Original Fees
                // if (voucher != null && rentTime != null)
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       const Text('Original fees',
                //           style: TextStyle(fontSize: 14.0)),
                //       Text(
                //           'Rp. ${formatter.format(widget.motor.hargaHarian! * rentTime!.duration.inHours)}',
                //           style: const TextStyle(fontSize: 14.0)),
                //     ],
                //   ),

                if (diskon != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Diskon', style: TextStyle(fontSize: 14.0)),
                      Text(
                          diskon != null
                              ? 'Rp. ${formatter.format(diskon!.jumlahDiskon)}'
                              : ' - ',
                          style: const TextStyle(fontSize: 14.0)),
                    ],
                  ),

                const SizedBox(height: 8.0),

                // Motor Applied Voucher Cut
                if (voucher != null && rentTime != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Voucher', style: TextStyle(fontSize: 14.0)),
                      Text(
                          voucher != null
                              ? '${voucher!.persenVoucher}%'
                              : ' - ',
                          style: const TextStyle(fontSize: 14.0)),
                    ],
                  ),

                // const SizedBox(height: 8.0),
                const Divider(
                  height: 50,
                ),

                // Motor Total Section \\
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                    Text(
                        rentTime != null
                            ? 'Rp. ${formatter.format(calculateFees(widget.motor, rentTime!, voucher, diskon))}'
                            : 'Rp. -',
                        style: const TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 24.0),

                // Rent Now Button \\
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      validateData();
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
        ),
        if (isLoading)
          Container(
            color: Colors.black.withOpacity(0.1),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
