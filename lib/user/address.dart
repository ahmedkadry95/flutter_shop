class Address {
  String? streetName ;
  String? streetNumber ;
  String? city ;
  String? state ;
  String? country ;
  String? postCode ;
  Address.fromJson(Map<String, dynamic> json) {
    this.streetName = json['street_name'];
    this.streetNumber = json['street_number'];
    this.city = json['city'];
    this.state = json['state'];
    this.country = json['country'];
    this.postCode = json['post_code'];
  }
}
