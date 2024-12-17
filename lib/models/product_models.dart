
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
  final String type;
  final String? place;

  CreateProductModel({required this.userId,required this.subtitle, required this.name, required this.price, required this.isPromo, required this.promotionalAmount, required this.promotionalPrice, required this.type, required this.place});

  factory CreateProductModel.fromJson(Map<String, dynamic> json) {
    return CreateProductModel(
      userId: json['userId'] as String,
      subtitle: json['subtitle'] as String,
      name: json['name'] as String,
      price: json['value'] as String,
      isPromo: json['is-promo'] as bool,
      promotionalAmount: json['quantidade-promo'] as int?,
      promotionalPrice: json['value-promo'] as String?,
      type: json['type'] as String,
      place: json['place'] as String?,
    );
  }


}