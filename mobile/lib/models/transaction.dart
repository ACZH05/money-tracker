enum TransactionType { income, expense }

class TransactionRecord {
  const TransactionRecord({
    required this.id,
    required this.title,
    required this.amount,
    required this.type,
    required this.category,
    required this.date,
    required this.paymentMethod,
    required this.note,
  });

  final String id;
  final String title;
  final double amount;
  final TransactionType type;
  final String category;
  final DateTime date;
  final String paymentMethod;
  final String note;
}
