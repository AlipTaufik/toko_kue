
import 'package:flutter/material.dart';
import 'package:flutter_cakery_shop_ui/data/cake.dart';

import 'package:flutter_cakery_shop_ui/screen/cart_provider.dart';
import 'package:flutter_cakery_shop_ui/widget/navbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CakeryDetail extends StatelessWidget {
  final String assetPath;
  final String cookieprice;
  final String cookiename;
  final Cake cake;

  const CakeryDetail({
    Key? key,
    required this.assetPath,
    required this.cookieprice,
    required this.cookiename,
    required this.cake,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pesan',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 24.0.sp,
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 16.0.h),
          Padding(
            padding: EdgeInsets.only(left: 16.0.sp),
            child: Text(
              'Kue',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 40.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
            ),
            child: Hero(
              tag: assetPath,
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.sp),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(assetPath),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Text(
              'Rp $cookieprice',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: Text(
              cookiename,
              style: TextStyle(
                  color: const Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0.sp),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 52.0,
              child: Text(
                'Bolu atau kue bolu adalah kue berbahan dasar tepung, gula, dan telur. Kue bolu dan cake umumnya dimatangkan dengan cara dipanggang di dalam oven, walaupun ada juga bolu yang dikukus',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0.sp,
                  color: const Color(0xFFB4B8B9),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100.0.w,
              height: 52.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0.sp),
                color: const Color(0xFFF17532),
              ),
              child: Center(
                child: InkWell(
                  onTap: () async {
                      var whatsappUrl = "whatsapp://send?phone=6285724477204&text=Hi Levinesz Cakery, Saya mau order $cookiename untuk hari ini, apa bisa diantar kerumah?";
                      
                      if (await launchUrl(Uri.parse(whatsappUrl))) {
                        await launchUrlString(whatsappUrl);
                      } else {
                        throw 'Could not launch $whatsappUrl';
                      }
                    },


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 32.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Pesan via Whatsapp',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28.0.h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cartProvider.addProductToCart(cake);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.blue,
                  content: Text('${cake.name} telah ditambahkan ke keranjang!'),
                ));
        },
        backgroundColor: const Color.fromARGB(255, 50, 117, 241),
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}

class CakeryDetailWeb extends StatelessWidget {
  final String assetPath;
  final String cookieprice;
  final String cookiename;
  const CakeryDetailWeb({Key? key,
    required this.assetPath,
    required this.cookieprice,
    required this.cookiename,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Pesan',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 10.0.sp,
            color: const Color(0xFF545D68),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF545D68),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10.0.h),
          Padding(
            padding: EdgeInsets.only(left: 16.0.sp),
            child: Text(
              'Kue',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 12.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.sp,
            ),
            child: Hero(
              tag: assetPath,
              child: Container(
                height: 500.h,
                width: 50.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.sp),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(assetPath),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Text(
              'Rp $cookieprice',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: Text(
              cookiename,
              style: TextStyle(
                  color: const Color(0xFF575E67),
                  fontFamily: 'Varela',
                  fontSize: 24.0.sp),
            ),
          ),
          SizedBox(height: 16.0.sp),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 52.0,
              child: Text(
                'Bolu atau kue bolu adalah kue berbahan dasar tepung, gula, dan telur. Kue bolu dan cake umumnya dimatangkan dengan cara dipanggang di dalam oven, walaupun ada juga bolu yang dikukus',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0.sp,
                  color: const Color(0xFFB4B8B9),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 100.0.w,
              height: 52.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0.sp),
                color: const Color(0xFFF17532),
              ),
              child: Center(
                child: InkWell(
                  onTap: () async {
                      var whatsappUrl = "whatsapp://send?phone=6285724477204&text=Hi Levinesz Cakery, Saya mau order $cookiename untuk hari ini, apa bisa diantar kerumah?";
                      
                      if (await launchUrl(Uri.parse(whatsappUrl))) {
                        await launchUrlString(whatsappUrl);
                      } else {
                        throw 'Could not launch $whatsappUrl';
                      }
                    },


                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.whatsapp,
                        size: 32.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Pesan via Whatsapp',
                        style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 28.0.h),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}

Widget _buildCard(Cake cake, context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.minWidth >= 501) {
        return CakeryDetailWeb(
        assetPath: cake.imageUrl,
        cookiename: cake.name,
        cookieprice: cake.price,);
      } else {
        return CakeryDetail(
            assetPath: cake.imageUrl,
            cookieprice: cake.price,
            cookiename: cake.name,
            cake: cake,);
      }
    },);
  }


class Mainwidget extends StatelessWidget {
  final Cake cake;
  const Mainwidget({super.key, required this.cake});

  @override
  Widget build(BuildContext context) {
    
    return _buildCard(cake, context);
  }
}

// class ProductDetailScreen extends StatelessWidget {
//   final Cake cake;

//   const ProductDetailScreen(this.cake, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     final cartProvider = Provider.of<CartProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(cake.name),
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
//                 icon: Icon(Icons.shopping_basket_outlined),
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
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 cartProvider.addProductToCart(cake);
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('${cake.name} telah ditambahkan ke keranjang!'),
//                 ));
//               },
//               child: Text('sadsa'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

