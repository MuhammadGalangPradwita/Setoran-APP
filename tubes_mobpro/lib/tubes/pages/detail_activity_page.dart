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
  late Color _paymentColor;

  @override
  void initState() {
    super.initState();

    _isFailed = (widget.activity['status'] == 'failed');
    _paymentColor = _isFailed ? AppColors.R400 : AppColors.G500;
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
            Text("Payment ${_isFailed ? 'Failed' : "Succes"}",
                style:
                    AppTextStyle.body3SemiBold.copyWith(color: _paymentColor)),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Detail Motorcycle"),
        const Gap(8),
        Card(
          elevation: 2,
          color: AppColors.N0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Brand'),
                    Text(widget.activity['motor']['brand']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Type'),
                    Text(widget.activity['motor']['tipe']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Tahun'),
                    Text(widget.activity['motor']['year']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Transmisi'),
                    Text(widget.activity['motor']['transmisi']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Police Number'),
                    Text(widget.activity['motor']['policeNumber']),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('STNK Number'),
                    Text(widget.activity['motor']['STNKNumber']),
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
