class BasePayment {
  String? id, paymentMethod;
  double? amount;
  DateTime? paymentDate;

  BasePayment(this.id, this.paymentMethod, this.amount, this.paymentDate);

  BasePayment.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.paymentMethod = json['payment_method'];
    this.amount = json['amount'];
    this.paymentDate = DateTime.parse(json['amount']);
  }
}
