class BaseImage {
  String? id, altText, url;

  BaseImage(this.id, this.altText, this.url);

  BaseImage.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.altText = json['alt_text'];
    this.url = json['url'];
  }

  }
