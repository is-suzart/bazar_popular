
import 'package:image_picker/image_picker.dart';

class Product {
  String id;
  String userId;
  bool active;
  ProductInfo info;
  List<String> images;
  Storage storage;
  String createdAt;
  String updatedAt;
  Map<String, String> customOption;
  String description;
  String pixType;
  String pixKey;

  Product({
    required this.id,
    required this.userId,
    required this.active,
    required this.info,
    required this.images,
    required this.storage,
    required this.createdAt,
    required this.updatedAt,
    required this.customOption,
    required this.description,
    required this.pixType,
    required this.pixKey,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      userId: json['user_id'],
      active: json['active'],
      info: ProductInfo.fromJson(json['info']),
      images: List<String>.from(json['images']),
      storage: Storage.fromJson(json['storage']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      customOption: Map<String, String>.from(json['custom_option']),
      description: json['description'],
      pixType: json['pix_type'],
      pixKey: json['pix_key'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'active': active,
      'info': info.toJson(),
      'images': images,
      'storage': storage.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
      'custom_option': customOption,
      'description': description,
      'pix_type': pixType,
      'pix_key': pixKey,
    };
  }
}

class ProductInfo {
  String title;
  String subtitle;
  String price;
  bool havePromotion;
  String? promotionalPrice;
  int? promotionalAmount;
  String productType;
  String? place;

  ProductInfo({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.havePromotion,
    this.promotionalPrice,
    this.promotionalAmount,
    required this.productType,
    this.place,
  });

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      havePromotion: json['have_promotion'],
      promotionalPrice: json['promotional_price'],
      promotionalAmount: json['promotional_amount'],
      productType: json['product_type'],
      place: json['place'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'price': price,
      'have_promotion': havePromotion,
      'promotional_price': promotionalPrice,
      'promotional_amount': promotionalAmount,
      'product_type': productType,
      'place': place,
    };
  }
}

class Storage {
  int total;
  int avaliable;
  int saled;

  Storage({
    required this.total,
    required this.avaliable,
    required this.saled,
  });

  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      total: json['total'],
      avaliable: json['avaliable'],
      saled: json['saled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'avaliable': avaliable,
      'saled': saled,
    };
  }
}

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

class UploadProductFormModel {
  final String id;
  final String description;
  final String pixType;
  final String pixKey;
  final List<XFile> pictures;

  UploadProductFormModel({required this.id, required this.description, required this.pixType, required this.pixKey, required this.pictures});
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