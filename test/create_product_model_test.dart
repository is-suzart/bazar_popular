import 'package:bazar_popular/models/product_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreateProductModel should have isPromo set to true', () {
    // Arrange
    var test = CreateProductModel(
      userId: "userId",
      subtitle: "subtitle",
      name: "name",
      price: "price",
      isPromo: true,
      productType: "productType",
      storage: 500,
    );

    // Act & Assert
    expect(test.isPromo, isTrue);
  });
}
