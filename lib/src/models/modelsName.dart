import 'dart:convert';

class Product {
    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.url,
    });

    int id;
    String title;
    String description;
    String url;

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["Description"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "Description": description,
        "url": url,
    };
}
