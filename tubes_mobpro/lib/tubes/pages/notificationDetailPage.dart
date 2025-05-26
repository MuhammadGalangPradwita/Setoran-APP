import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/utilities/app_util.dart';

class NotificationDetailPage extends StatelessWidget {
  final Notifikasi notification;

  const NotificationDetailPage({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Notification"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              notification.judul!, // Menampilkan judul notifikasi
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            _buildDetailRow("Transaction ID", "No. 1800234356"),
            _buildDetailRow("Type", "NMAX"),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Rent Date:",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      _buildDetailRow("Start Date", "26 Oct 2024"),
                      _buildDetailRow("End Date", "26 Oct 2024"),
                    ],
                  ),
                ),
              ],
            ),
            _buildDetailRow("Payment Method", "Bank Transfer"),
            _buildDetailRow("Price", "Rp. 50.000,00"),
            _buildDetailRow("Status", "Success",
                valueColor: Colors.green, valueFontWeight: FontWeight.bold),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    Color? valueColor,
    FontWeight? valueFontWeight,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: valueColor ?? Colors.black,
              fontWeight: valueFontWeight ?? FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Modified NotificationPage with navigation
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Notifikasi> notifications = [
    // NotificationItem(
    //   title: "Transaction successful",
    //   message:
    //       "You have successfully made a transaction. Be careful when driving.",
    //   date: "26 Oct 2024",
    //   isRead: true,
    //   transactionId: "1800234356",
    //   type: "NMAX",
    //   startDate: "26 Oct 2024",
    //   endDate: "26 Oct 2024",
    //   paymentMethod: "Bank Transfer",
    //   price: "Rp. 50.000,00",
    //   status: "Success",
    // ),
    // NotificationItem(
    //   title: "Transaction failed",
    //   message: "Sorry, your transaction failed. Try reordering",
    //   date: "26 Oct 2024",
    //   isRead: false,
    //   transactionId: "1800234357",
    //   type: "NMAX",
    //   startDate: "26 Oct 2024",
    //   endDate: "26 Oct 2024",
    //   paymentMethod: "Bank Transfer",
    //   price: "Rp. 50.000,00",
    //   status: "Failed",
    // ),
    // NotificationItem(
    //   title: "Transaction successful",
    //   message:
    //       "You have successfully made a transaction. Be careful when driving.",
    //   date: "25 Oct 2024",
    //   isRead: false,
    //   transactionId: "1800234358",
    //   type: "NMAX",
    //   startDate: "25 Oct 2024",
    //   endDate: "25 Oct 2024",
    //   paymentMethod: "Bank Transfer",
    //   price: "Rp. 50.000,00",
    //   status: "Success",
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.N0,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Notification"),
        backgroundColor: AppColors.B400,
        foregroundColor: AppColors.N0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        notifications[index].isRead = true;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotificationDetailPage(
                            notification: notifications[index],
                          ),
                        ),
                      );
                    },
                    child: NotificationCard(
                      notification: notifications[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatefulWidget {
  final Notifikasi notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: BoxDecoration(
        color: widget.notification.isRead
            ? AppColors.N200 // Gray for read notifications
            : AppColors.B200, // Light blue for unread notifications
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.notification.judul!,
                style: AppTextStyle.body2Bold.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                AppUtil.formatDate(widget.notification.waktuNotifikasi!),
                style: AppTextStyle.body3Regular.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.notification.deskripsi!,
            style: AppTextStyle.body2Regular.copyWith(color: AppColors.N700),
          ),
        ],
      ),
    );
  }
}
