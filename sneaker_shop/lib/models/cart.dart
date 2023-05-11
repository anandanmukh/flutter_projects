import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'AIR JORDAN1LOW',
        price: '8995',
        imagePath: 'lib/images/shoe_1.png',
        description: 'The forward-thinking design'),
    Shoe(
        name: 'Nike Dunk Low Retro',
        price: '11895',
        imagePath: 'lib/images/shoe_2.png',
        description: 'The forward-thinking design.'),
    Shoe(
        name: 'Nike Blazer Mid \'77',
        price: '8295',
        imagePath: 'lib/images/shoe_3.png',
        description: 'The forward-thinking design.'),
    Shoe(
        name: 'Nike Free Metcon 5',
        price: '14000',
        imagePath: 'lib/images/shoe_4.png',
        description: 'The forward-thinking design.'),
    Shoe(
        name: 'Zoom FREAK',
        price: '20000',
        imagePath: 'lib/images/shoe_5.png',
        description: 'The forward-thinking design.'),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
