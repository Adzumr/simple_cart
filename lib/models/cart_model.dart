class CartModel {
  final String? product;
  final int? price;

  CartModel({
    this.product,
    this.price,
  });

  CartModel.fromJson(Map<String, dynamic> json)
      : product = json['Product'] as String?,
        price = json['Price'] as int?;

  Map<String, dynamic> toJson() => {
        'Product': product,
        'Price': price,
      };
}
