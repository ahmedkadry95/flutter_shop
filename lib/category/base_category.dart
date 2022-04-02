 class BaseCategory {
  String? id, title;
  BaseCategory(this.id, this.title);
  BaseCategory.fromJson(Map<String,dynamic> json){
    this.id = json['id'];
    this.title = json['title'];
  }
}
