class NotificationItem {
  final String title;
  final String message;
  final String date;
  bool isRead;
  final String transactionId;
  final String type;
  final String startDate;
  final String endDate;
  final String paymentMethod;
  final String price;
  final String status;

  NotificationItem({
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
    required this.transactionId,
    required this.type,
    required this.startDate,
    required this.endDate,
    required this.paymentMethod,
    required this.price,
    required this.status,
  });
}