class BaseTag {
  String? id, title;

  BaseTag(this.id, this.title);

  BaseTag.fromJson(Map<String,dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
  }
}
