import 'package:flutter/material.dart';
import 'package:tubes_mobpro/tubes/api_utilities/lib/api.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';
import 'package:tubes_mobpro/tubes/themes/app_theme.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Sample notification data
  final List<Notifikasi> notifications = [
    Notifikasi(
      idNotifikasi: 0,
      idPengguna: "0",
      judul: "Lengkapi data",
      deskripsi: "Silahkan lengkapi data data anda di halaman edit profile",
      // navigasi: Navigasi.editProfile,
      dataNavigasi: null,
      isRead: false,
      // isSent: false,
      // createdAt: DateTime.now()
    ),
    Notifikasi(
      idNotifikasi: 0,
      idPengguna: "0",
      judul: "Transaksi di ...",
      deskripsi: "Update mengenai transaksi",
      // navigasi: Navigasi.transaksi,
      dataNavigasi: {"id_transaksi": "1"},
      isRead: false,
      // isSent: false,
      // createdAt: DateTime.now()
    ),
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
    //   message: "You have successfully made a transaction. Be careful when driving.",
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
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: AppTextStyle.body1Bold.copyWith(color: Colors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        notifications[index].isRead = true;
                      });
                      // notifications[index].onClick(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => NotificationDetailPage(
                      //         notification: notifications[index]
                      //       )
                      //     )
                      // );
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

class NotificationCard extends StatelessWidget {
  final Notifikasi notification;

  const NotificationCard({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(16),
      height: 130,
      decoration: BoxDecoration(
        color: notification.isRead ? AppColors.N200 : AppColors.B200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notification.judul!,
                style: AppTextStyle.body2Bold.copyWith(color: Colors.black),
              ),
              // Text(
              //   AppUtil.formatDate(notification.createdAt),
              //   style: AppTextStyle.body3Regular.copyWith(color: Colors.black),
              // ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            notification.deskripsi!,
            style: AppTextStyle.body2Regular.copyWith(color: AppColors.N700),
          ),
        ],
      ),
    );
  }
}

// class NotificationItem {
//   final String title;
//   final String message;
//   final String date;
//   bool isRead;

//   NotificationItem({
//     required this.title,
//     required this.message,
//     required this.date,
//     required this.isRead,
//   });
// }