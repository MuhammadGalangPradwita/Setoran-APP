import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class DetailActivityPage extends StatefulWidget {
  final Map<String, dynamic> activity;

  const DetailActivityPage({super.key, required this.activity});

  @override
  State<DetailActivityPage> createState() => _DetailActivityPageState();
}

class _DetailActivityPageState extends State<DetailActivityPage> {
  late bool _isFailed;

  @override
  void initState() {
    super.initState();

    _isFailed = (widget.activity['status'] == 'failed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Details Activity"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: (_isFailed)
              ? [_paymentDetailCard()]
              : [_paymentDetailCard(), const Gap(12), _motorDetailCard()],
        ),
      ),
    );
  }

  Widget _paymentDetailCard() {
    return Card(
      elevation: 2,
      color: AppColors.N0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Payment Succes",
                style:
                    AppTextStyle.body3SemiBold.copyWith(color: AppColors.G500)),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.activity['orderNumber'],
                  style: AppTextStyle.smallSemiBold
                      .copyWith(color: AppColors.N600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Type"), Text(widget.activity['tipe'])],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rent Date"),
                Text(widget.activity['date'])
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method"),
                // Text(widget.activity['date']),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const Text("Price"), Text(widget.activity['price'])],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Status"),
                Text(widget.activity['status'].toString())
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _motorDetailCard() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Detail Motorcycle"),
        Gap(8),
        Card(
          elevation: 2,
          color: AppColors.N0,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Brand'),
                  ],
                ),
                Row(
                  children: [
                    Text('Type'),
                  ],
                ),
                Row(
                  children: [
                    Text('Tahun'),
                  ],
                ),
                Row(
                  children: [
                    Text('Transmisi'),
                  ],
                ),
                Row(
                  children: [
                    Text('Police Number'),
                  ],
                ),
                Row(
                  children: [
                    Text('STNK Number'),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
