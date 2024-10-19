import 'package:flutter/material.dart';
import 'package:flutter_cakery_shop_ui/screen/cakery_detail.dart';
import 'package:flutter_cakery_shop_ui/widget/navbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/cake.dart';

class CakeryPage extends StatelessWidget {
  const CakeryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika lebar layar lebih dari 600px, tampilkan versi web
        if (constraints.maxWidth > 600) {
          return CakeryWebPage();
        } else {
          return CakeryMobilePage();
        }
      },
    );
  }
}

class CakeryMobilePage extends StatelessWidget {
  const CakeryMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 155, 71),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 20.sp,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,  // 2 kolom di mobile
            crossAxisSpacing: 8.sp,
            mainAxisSpacing: 8.sp,
            childAspectRatio: 0.7.sp,
          ),
          itemBuilder: (context, index) {
            return _buildCard(listCakes[index], context);
          },
          itemCount: listCakes.length,
        ),
      ),
      
    );
  }

  Widget _buildCard(Cake cake, context) {
    return _buildCommonCard(cake, context);
  }
}

class CakeryWebPage extends StatelessWidget {
  const CakeryWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 219, 120),
      body: Padding(
        padding: EdgeInsets.all(10.0), // Tambahan padding untuk web
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,  // 4 kolom di versi web
            crossAxisSpacing: 10.sp,
            mainAxisSpacing: 10.sp,
            childAspectRatio: 0.75, // Penyesuaian rasio tampilan untuk web
          ),
          itemBuilder: (context, index) {
            return _buildCard(listCakes[index], context);
          },
          itemCount: listCakes.length,
        ),
      ),
      
    );
  }

  Widget _buildCard(Cake cake, context) {
    return _buildCommonCardWeb(cake, context);
  }
}

Widget _buildCommonCard(Cake cake, context) {
  return Padding(
    padding: EdgeInsets.all(2.sp),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Mainwidget(
            cake: cake,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 200, 54, 54).withOpacity(0.2),
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
              padding: EdgeInsets.only(
                right: 9.sp,
                top: 8.sp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cake.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Color(0xFFEF7532),
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Color(0xFFEF7532),
                        )
                ],
              ),
            ),
            Container(
              height: 90.h,  // Penyesuaian tinggi gambar untuk web
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(cake.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                'Rp ${cake.price}',
                style: TextStyle(
                    color: const Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 12.sp),
              ),
            ),
            Center(
              child: Text(
                cake.name,
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
                color: Color.fromARGB(255, 205, 57, 57),
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

Widget _buildCommonCardWeb(Cake cake, context) {
  return Padding(
    padding: EdgeInsets.all(8.sp),
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Mainwidget(
            cake: cake,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 200, 54, 54).withOpacity(0.2),
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
              padding: EdgeInsets.only(
                right: 9.sp,
                top: 8.sp,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  cake.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Color(0xFFEF7532),
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Color(0xFFEF7532),
                        )
                ],
              ),
            ),
            Container(
              height: 150.h,  // Penyesuaian tinggi gambar untuk web
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: AssetImage(cake.imageUrl),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Text(
                'Rp ${cake.price}',
                style: TextStyle(
                    color: const Color(0xFFCC8053),
                    fontFamily: 'Varela',
                    fontSize: 9.sp),
              ),
            ),
            Center(
              child: Text(
                cake.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: const Color(0xFF575E67),
                    fontFamily: 'Varela',
                    fontSize: 8.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Container(
                color: Color.fromARGB(255, 205, 57, 57),
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
