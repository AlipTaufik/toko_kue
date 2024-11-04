import 'package:flutter/material.dart';
import 'package:flutter_cakery_shop_ui/data/cake.dart';
import 'package:flutter_cakery_shop_ui/data/drink.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final checkoutResult = cartProvider.checkout();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Keranjang'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Cake'),
              Tab(text: 'Drink'),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // Tab untuk Cake
                  ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (context, index) {
                      final cake = cartProvider.items.values.toList()[index];
                      return ListTile(
                        title: Text(cake.name),
                        subtitle:
                            Text('Harga: ${cake.price} x ${cake.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cartProvider.addProductQuantity(cake.id);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cartProvider.removeProductFromCart(cake.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Tab untuk Drink
                  ListView.builder(
                    itemCount: cartProvider.drinks.length,
                    itemBuilder: (context, index) {
                      final drink = cartProvider.drinks.values.toList()[index];
                      return ListTile(
                        title: Text(drink.name),
                        subtitle:
                            Text('Harga: ${drink.price} x ${drink.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                cartProvider.addDrinkQuantity(drink.id);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cartProvider.removeDrinkFromCart(drink.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Total Item: ${checkoutResult['totalItems']}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total Harga: Rp ${checkoutResult['totalPrice'].toStringAsFixed(3)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _printCheckout(context, cartProvider);
                    },
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fungsi untuk menampilkan detail cetakan checkout lengkap dengan daftar item
void _printCheckout(BuildContext context, CartProvider cartProvider) {
  final checkoutItems = [
    ...cartProvider.items.values,
    ...cartProvider.drinks.values,
  ];

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Detail Checkout"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Total Item: ${cartProvider.itemCount + cartProvider.drinkCount}"),
              Text(
                  "Total Harga: Rp ${cartProvider.checkout()['totalPrice'].toStringAsFixed(3)}"),
              Divider(),
              Text("Daftar Item:",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ...checkoutItems.map((item) {
                if (item is Cake) {
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("Jumlah: ${item.quantity}"),
                    trailing: Text(
                        "Rp ${(item.quantity * double.parse(item.price)).toStringAsFixed(3)}",
                        style: const TextStyle(fontSize: 14)),
                  );
                } else if (item is Drink) {
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("Jumlah: ${item.quantity}"),
                    trailing: Text(
                        "Rp ${(item.quantity * double.parse(item.price)).toStringAsFixed(3)}",
                        style: const TextStyle(fontSize: 14)),
                  );
                } else {
                  return SizedBox();
                }
              }),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Tutup"),
          ),
        ],
      );
    },
  );
}
