import 'package:flutter/material.dart';
import 'package:flutter_cakery_shop_ui/data/cake.dart';
import 'package:flutter_cakery_shop_ui/data/drink.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Cake> _items = {};
  final Map<String, Drink> _itemss = {};

  Map<String, Cake> get items => _items;
  Map<String, Drink> get drinks => _itemss;

  int get itemCount => _items.length; // Jumlah item Cake di keranjang
  int get drinkCount => _itemss.length; // Jumlah item Drink di keranjang

  void addProductToCart(Cake cake) {
    if (_items.containsKey(cake.id)) {
      // Tambah jumlah item jika sudah ada di keranjang
      _items.update(
        cake.id,
        (existingCake) => Cake(
          id: existingCake.id,
          name: existingCake.name,
          price: existingCake.price,
          imageUrl: existingCake.imageUrl,
          isFavorite: existingCake.isFavorite,
          subMenu: existingCake.subMenu,
          quantity: existingCake.quantity + 1,
        ),
      );
    } else {
      // Jika belum ada, tambahkan item dengan jumlah awal 1
      _items.putIfAbsent(
        cake.id,
        () => Cake(
          id: cake.id,
          name: cake.name,
          price: cake.price,
          imageUrl: cake.imageUrl,
          isFavorite: cake.isFavorite,
          subMenu: cake.subMenu,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void addDrinkToCart(Drink drink) {
    if (_itemss.containsKey(drink.id)) {
      // Tambah jumlah item jika sudah ada di keranjang
      _itemss.update(
        drink.id,
        (existingDrink) => Drink(
          id: existingDrink.id,
          name: existingDrink.name,
          price: existingDrink.price,
          deskripsi: existingDrink.deskripsi,
          imageUrl: existingDrink.imageUrl,
          isFavorite: existingDrink.isFavorite,
          subMenu: existingDrink.subMenu,
          quantity: existingDrink.quantity + 1,
        ),
      );
    } else {
      // Jika belum ada, tambahkan item dengan jumlah awal 1
      _itemss.putIfAbsent(
        drink.id,
        () => Drink(
          id: drink.id,
          name: drink.name,
          price: drink.price,
          deskripsi: drink.deskripsi,
          imageUrl: drink.imageUrl,
          isFavorite: drink.isFavorite,
          subMenu: drink.subMenu,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  // Fungsi untuk menambah jumlah item Cake sebanyak 1
  void addProductQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCake) => Cake(
          id: existingCake.id,
          name: existingCake.name,
          price: existingCake.price,
          imageUrl: existingCake.imageUrl,
          isFavorite: existingCake.isFavorite,
          subMenu: existingCake.subMenu,
          quantity: existingCake.quantity + 1,
        ),
      );
      notifyListeners();
    }
  }

  // Fungsi untuk menambah jumlah item Drink sebanyak 1
  void addDrinkQuantity(String drinkId) {
    if (_itemss.containsKey(drinkId)) {
      _itemss.update(
        drinkId,
        (existingDrink) => Drink(
          id: existingDrink.id,
          name: existingDrink.name,
          price: existingDrink.price,
          deskripsi: existingDrink.deskripsi,
          imageUrl: existingDrink.imageUrl,
          isFavorite: existingDrink.isFavorite,
          subMenu: existingDrink.subMenu,
          quantity: existingDrink.quantity + 1,
        ),
      );
      notifyListeners();
    }
  }

  void removeProductFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeDrinkFromCart(String drinkId) {
    _itemss.remove(drinkId);
    notifyListeners();
  }

  Map<String, dynamic> checkout() {
    int totalItems = _items.values.fold(0, (sum, item) => sum + item.quantity) +
                     _itemss.values.fold(0, (sum, drink) => sum + drink.quantity);
    double totalPrice = _items.values.fold(0.0, (sum, item) => sum + (item.quantity * double.parse(item.price))) +
                        _itemss.values.fold(0.0, (sum, drink) => sum + (drink.quantity * double.parse(drink.price)));

    return {
      'totalItems': totalItems,
      'totalPrice': totalPrice,
    };
  }
}
