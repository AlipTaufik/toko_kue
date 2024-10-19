import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cakery_shop_ui/data/drink.dart';
import 'package:flutter_cakery_shop_ui/screen/drink_detail.dart';
import 'package:flutter_cakery_shop_ui/widget/navbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkPage extends StatelessWidget {
  const DrinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar lebih dari 600px, tampilkan versi web
        if (constraints.maxWidth > 600) {
          return DrinkWebPage();
        } else {
          return DrinkMobilePage();
        }
      },
    );
  }
}

class DrinkMobilePage extends StatelessWidget {
  const DrinkMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 155, 71),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.sp),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 kolom di mobile
            crossAxisSpacing: 8.sp,
            mainAxisSpacing: 8.sp,
            childAspectRatio: 0.7.sp,
          ),
          itemBuilder: (context, index) {
            return _buildCard(listDrinks[index], context);
          },
          itemCount: listDrinks.length,
        ),
      ),
      
    );
  }

  Widget _buildCard(Drink drink, context) {
    return _buildCommonCard(drink, context);
  }
}

class DrinkWebPage extends StatelessWidget {
  const DrinkWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 219, 120),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Tambahan padding untuk web
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 4 kolom di versi web
            crossAxisSpacing: 16.sp,
            mainAxisSpacing: 16.sp,
            childAspectRatio: 0.75, // Penyesuaian rasio tampilan untuk web
          ),
          itemBuilder: (context, index) {
            return _buildCard(listDrinks[index], context);
          },
          itemCount: listDrinks.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.local_drink),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }

  Widget _buildCard(Drink drink, context) {
    return _buildCommonCardWeb(drink, context);
  }
}

Widget _buildCommonCard(Drink drink, context) {
  return Padding(
    padding: EdgeInsets.all(2.sp),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Mainwidget(
            drink: drink,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 200, 54, 54).withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Colors.white,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(right: 9.sp, top: 8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  drink.isFavorite
                      ? const Icon(Icons.favorite, color: Color(0xFFEF7532))
                      : const Icon(Icons.favorite_border, color: Color(0xFFEF7532))
                ],
              ),
            ),
            Container(
              height: 90.h, // Penyesuaian tinggi gambar untuk mobile
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(drink.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                'Rp ${drink.price}',
                style: TextStyle(
                    color: const Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 12.sp),
              ),
            ),
            Center(
              child: Text(
                drink.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: const Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 12.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0.sp),
              child: Container(
                color: const Color.fromARGB(255, 205, 57, 57),
                height: 0.5.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat, color: const Color(0xFFD17E50), size: 16.sp),
                  SizedBox(width: 10.sp),
                  Text(
                    'Chat',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: const Color(0xFFD17E50),
                        fontSize: 12.sp),
                  ),
                  SizedBox(width: 16.h),
                  Icon(Icons.remove_circle_outline, color: const Color(0xFFD17E50), size: 16.sp),
                  SizedBox(width: 8.w),
                  Text(
                    '5',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: const Color(0xFFD17E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                  SizedBox(width: 8.w),
                  Icon(Icons.add_circle_outline, color: const Color(0xFFD17E50), size: 16.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCommonCardWeb(Drink drink, context) {
  return Padding(
    padding: EdgeInsets.all(8.sp),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Mainwidget(
            drink: drink,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 200, 54, 54).withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            )
          ],
          color: Colors.white,
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(right: 9.sp, top: 8.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  drink.isFavorite
                      ? const Icon(Icons.favorite, color: Color(0xFFEF7532))
                      : const Icon(Icons.favorite_border, color: Color(0xFFEF7532))
                ],
              ),
            ),
            Container(
              height: 100.h, // Penyesuaian tinggi gambar untuk web
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(drink.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                'Rp ${drink.price}',
                style: TextStyle(
                    color: const Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 10.sp),
              ),
            ),
            Center(
              child: Text(
                drink.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: const Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 10.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                color: const Color.fromARGB(255, 205, 57, 57),
                height: 0.5.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat, color: const Color(0xFFD17E50), size: 10.sp),
                  SizedBox(width: 6.sp),
                  Text(
                    'Chat',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: const Color(0xFFD17E50),
                        fontSize: 8.sp),
                  ),
                  SizedBox(width: 10.h),
                  Icon(Icons.remove_circle_outline, color: const Color(0xFFD17E50), size: 10.sp),
                  SizedBox(width: 4.w),
                  Text(
                    '5',
                    style: TextStyle(
                        fontFamily: 'Varela',
                        color: const Color(0xFFD17E50),
                        fontWeight: FontWeight.bold,
                        fontSize: 8.sp),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.add_circle_outline, color: const Color(0xFFD17E50), size: 10.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
