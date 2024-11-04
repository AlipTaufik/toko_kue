
import 'package:flutter/material.dart';

import 'package:flutter_cakery_shop_ui/home.dart';

import 'package:flutter_cakery_shop_ui/screen/cart_provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Keranjang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(),
    );
      }, 
    );
    
  }
}

// class ProductListScreen extends StatelessWidget {
//   final List<Product> products = [
//     Product(id: '1', title: 'Produk A', price: 10000),
//     Product(id: '2', title: 'Produk B', price: 15000),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Produk'),
//         actions: [
//           Consumer<CartProvider>(
//             builder: (_, cartProvider, __) => badges_pkg.Badge(
//               badgeContent: Text(
//                 cartProvider.itemCount.toString(),
//                 style: TextStyle(color: Colors.white),
//               ),
//               showBadge: cartProvider.itemCount > 0,
//               position: BadgePosition.topEnd(top: 0, end: 3),
//               child: IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (_) => CartScreen(),
//                   ));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           final product = products[index];
//           return ListTile(
//             title: Text(product.title),
//             subtitle: Text('Harga: ${product.price}'),
//             onTap: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (_) => ProductDetailScreen(product),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
