class AppDataModel {
  final Category? category;
  final Offers? offers;
  final List<Deals>? deals;

  AppDataModel({
    this.category,
    this.offers,
    this.deals,
  });

  AppDataModel.fromJson(Map<String, dynamic> json)
      : category = (json['category'] as Map<String, dynamic>?) != null
            ? Category.fromJson(json['category'] as Map<String, dynamic>)
            : null,
        offers = (json['offers'] as Map<String, dynamic>?) != null
            ? Offers.fromJson(json['offers'] as Map<String, dynamic>)
            : null,
        deals = (json['deals'] as List?)
            ?.map((dynamic e) => Deals.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'category': category?.toJson(),
        'offers': offers?.toJson(),
        'deals': deals?.map((e) => e.toJson()).toList()
      };
}

class Category {
  final List<Steak>? steak;
  final List<Vegetables>? vegetables;
  final List<Beverages>? beverages;
  final List<Juice>? juice;
  final List<Fish>? fish;

  Category({
    this.steak,
    this.vegetables,
    this.beverages,
    this.juice,
    this.fish,
  });

  Category.fromJson(Map<String, dynamic> json)
      : steak = (json['steak'] as List?)
            ?.map((dynamic e) => Steak.fromJson(e as Map<String, dynamic>))
            .toList(),
        vegetables = (json['vegetables'] as List?)
            ?.map((dynamic e) => Vegetables.fromJson(e as Map<String, dynamic>))
            .toList(),
        beverages = (json['beverages'] as List?)
            ?.map((dynamic e) => Beverages.fromJson(e as Map<String, dynamic>))
            .toList(),
        juice = (json['juice'] as List?)
            ?.map((dynamic e) => Juice.fromJson(e as Map<String, dynamic>))
            .toList(),
        fish = (json['fish'] as List?)
            ?.map((dynamic e) => Fish.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'steak': steak?.map((e) => e.toJson()).toList(),
        'vegetables': vegetables?.map((e) => e.toJson()).toList(),
        'beverages': beverages?.map((e) => e.toJson()).toList(),
        'juice': juice?.map((e) => e.toJson()).toList(),
        'fish': fish?.map((e) => e.toJson()).toList()
      };
}

class Steak {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final bool? isFavorite;

  Steak({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.isFavorite,
  });

  Steak.fromJson(Map<String, dynamic> json)
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

class Vegetables {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final bool? isFavorite;

  Vegetables({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.isFavorite,
  });

  Vegetables.fromJson(Map<String, dynamic> json)
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

class Beverages {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final bool? isFavorite;

  Beverages({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.isFavorite,
  });

  Beverages.fromJson(Map<String, dynamic> json)
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

class Juice {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final bool? isFavorite;

  Juice({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.isFavorite,
  });

  Juice.fromJson(Map<String, dynamic> json)
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

class Fish {
  final String? product;
  final int? price;
  final String? photo;
  final double? ratings;
  final bool? isFavorite;

  Fish({
    this.product,
    this.price,
    this.photo,
    this.ratings,
    this.isFavorite,
  });

  Fish.fromJson(Map<String, dynamic> json)
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
  final bool? isFavorite;

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
