abstract class BaseDiscount {
  double? minQuantity, maxQuantity, amount;
  DateTime? endDate;

  BaseDiscount(this.minQuantity, this.maxQuantity, this.amount, this.endDate);
  BaseDiscount.fromJson(Map<String,dynamic> json){
    this.minQuantity = json['min_quantity'];
    this.maxQuantity = json['max_quantity'];
    this.amount = json['amount'];
    //parse from String to DateTime
    this.endDate = DateTime.parse(json['end_date']);
  }

}
