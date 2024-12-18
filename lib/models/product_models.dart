
class CreateProductFormModel {
   final String title;
   final String subtitle;
   final String name;
   final String value;
   final String isPromo;
   final String quantidadePromo;
   final String valuePromo;
   final String storage;
   final String? place;

  CreateProductFormModel( {required this.title, required this.subtitle, required this.name, required this.value, required this.isPromo, required this.quantidadePromo, required this.valuePromo, required this.storage, this.place});

}

class CreateProductModel {
  final String userId;
  final String subtitle;
  final String name;
  final String price;
  final bool isPromo;
  final int? promotionalAmount;
  final String? promotionalPrice;
  final String productType;
  final int storage;
  final String? place;

  CreateProductModel({required this.userId,required this.subtitle, required this.name, required this.price, required this.isPromo, this.promotionalAmount, this.promotionalPrice, required this.productType, required this.storage, this.place});

  factory CreateProductModel.fromJson(Map<String?, dynamic> json) {
    return CreateProductModel(
      userId: json['userId'] as String,
      subtitle: json['subtitle'] as String,
      name: json['name'] as String,
      price: json['value'] as String,
      isPromo: json['is-promo'] as bool,
      promotionalAmount: json['quantidade-promo'] as int?,
      promotionalPrice: json['value-promo'] as String?,
      storage: json['storage'] as int,
      productType: json['type'] as String,
      place: json['place'] as String?,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'info': {
        'subtitle': subtitle,
        'title': name,
        'price': price,
        'have_promotion': isPromo,
        'promotional_amount': promotionalAmount,
        'promotional_price': promotionalPrice,
        'product_type': productType,
        'place': place,
      },
      'storage': storage,
    };
  }


}