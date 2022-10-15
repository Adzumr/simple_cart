class CartModel {
  final String? product;
  final int? price;
  final int? quantity;

  CartModel({
    this.product,
    this.price,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json)
      : product = json['Product'] as String?,
        price = json['Price'] as int?,
        quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() =>
      {'Product': product, 'Price': price, 'quantity': quantity};
}
