class CatagoryModel {
  final String slug;
  final String name;
  final String url;
  final String image;

  CatagoryModel(
      {required this.slug,
      required this.name,
      required this.url,
      required this.image});

  factory CatagoryModel.fromJson(Map<String, dynamic> json) {
    return CatagoryModel(
      slug: json['slug'] ?? "",
      name: json['name'] ?? "",
      url: json['url'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
