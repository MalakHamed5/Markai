import 'package:ecommerse/features/cart/data/model/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CartModel should parse nested list correctly', () {
    final json = {
      "list": [
        {
          "list": [
            {
              "id": 1,
              "title": "Test Product",
              "price": 10.0
            }
          ]
        }
      ]
    };

    final cart = CartModel.fromJson(json);

    expect(cart.products.length, 1);
    expect(cart.products.first.id, 1);
    expect(cart.products.first.title, "Test Product");
  });
}