class AppDataModel {
  final List<Category>? category;
  final Offers? offers;
  final List<Deals>? deals;

  AppDataModel({
    this.category,
    this.offers,
    this.deals,
  });

  AppDataModel.fromJson(Map<String, dynamic> json)
      : category = (json['category'] as List?)
            ?.map((dynamic e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        offers = (json['offers'] as Map<String, dynamic>?) != null
            ? Offers.fromJson(json['offers'] as Map<String, dynamic>)
            : null,
        deals = (json['deals'] as List?)
            ?.map((dynamic e) => Deals.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'category': category?.map((e) => e.toJson()).toList(),
        'offers': offers?.toJson(),
        'deals': deals?.map((e) => e.toJson()).toList()
      };
}

class Category {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final bool? isFavorite;

  Category({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.isFavorite,
  });

  Category.fromJson(Map<String, dynamic> json)
      : product = json['Product'] as String?,
        price = json['Price'] as int?,
        photo = json['Photo'] as String?,
        ratings = json['Ratings'] as double?,
        isFavorite = json['isFavorite'] as bool?;

  Map<String, dynamic> toJson() => {
        'Product': product,
        'Price': price,
        'Photo': photo,
        'Ratings': ratings,
        'isFavorite': isFavorite
      };
}

class Offers {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final String? date;

  Offers({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.date,
  });

  Offers.fromJson(Map<String, dynamic> json)
      : product = json['Product'] as String?,
        price = json['Price'] as int?,
        photo = json['Photo'] as String?,
        ratings = json['Ratings'] as double?,
        date = json['date'] as String?;

  Map<String, dynamic> toJson() => {
        'Product': product,
        'Price': price,
        'Photo': photo,
        'Ratings': ratings,
        'date': date
      };
}

class Deals {
  final String? product;
  final int? price;
  final String? photo;
  final int? quantity;
  final String? location;
  dynamic isFavorite;

  Deals({
    this.product,
    this.price,
    this.photo,
    this.quantity,
    this.location,
    this.isFavorite,
  });

  Deals.fromJson(Map<String, dynamic> json)
      : product = json['Product'] as String?,
        price = json['Price'] as int?,
        photo = json['Photo'] as String?,
        quantity = json['quantity'] as int?,
        location = json['location'] as String?,
        isFavorite = json['isFavorite'] as bool?;

  Map<String, dynamic> toJson() => {
        'Product': product,
        'Price': price,
        'Photo': photo,
        'quantity': quantity,
        'location': location,
        'isFavorite': isFavorite
      };
}
