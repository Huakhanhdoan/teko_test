class ItemModel {
  final String name;
  final int price;
  final String? imageSrc;

  ItemModel({
    required this.name,
    required this.price,
    this.imageSrc,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      price: json['price'],
      imageSrc: json['imageSrc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageSrc': imageSrc,
    };
  }
}
