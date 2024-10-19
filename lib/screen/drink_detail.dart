// Generated by Dart Safe Data Class Generator. * Change this header on extension settings *
// ignore_for_file: type=lint
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:flutter_cakery_shop_ui/data/drink.dart';
import 'package:flutter_cakery_shop_ui/widget/navbar_widget.dart';

class DrinkDetail extends StatelessWidget {
  final String pat;
  final String assetPath;
  final String drinkprice;
  final String drinkname;
  const DrinkDetail({
    Key? key, 
   required this.assetPath,
   required this.drinkprice,
   required this.drinkname,
   required this.pat}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              'Minuman',
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
                    image: CachedNetworkImageProvider(assetPath),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Text(
              'Rp $drinkprice',
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
              drinkname,
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
                '${pat}',
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
                      var whatsappUrl = "whatsapp://send?phone=6285724477204&text=Hi Levinesz Cakery, Saya mau order $drinkname untuk hari ini, apa bisa diantar kerumah?";
                      
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
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}

class DrinkDetailWeb extends StatelessWidget {
  final String pat;
  final String assetPath;
  final String drinkprice;
  final String drinkname;
  const DrinkDetailWeb({Key? key, 
   required this.assetPath,
   required this.drinkprice,
   required this.drinkname,
   required this.pat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              'Minuman',
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
                height: MediaQuery.of(context).size.height - 200.0,
                width: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.sp),
                  image: DecorationImage(
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    image: CachedNetworkImageProvider(assetPath),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Center(
            child: Text(
              'Rp $drinkprice',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFF17532),
              ),
            ),
          ),
          SizedBox(height: 10.0.sp),
          Center(
            child: Text(
              drinkname,
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
                '${pat}',
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
                      var whatsappUrl = "whatsapp://send?phone=6285724477204&text=Hi Levinesz Cakery, Saya mau order $drinkname untuk hari ini, apa bisa diantar kerumah?";
                      
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
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}

Widget _buildCard(Drink drink, context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.minWidth >= 501) {
        return DrinkDetailWeb(
        assetPath: drink.imageUrl,
        drinkname: drink.name,
        drinkprice: drink.price,
        pat: drink.deskripsi,);
      } else {
        return DrinkDetail(
            assetPath: drink.imageUrl,
            drinkprice: drink.price,
            drinkname: drink.name,
            pat: drink.deskripsi,);
      }
    },);
  }
class Mainwidget extends StatelessWidget {
  final Drink drink;
  const Mainwidget({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildCard(drink, context);
  }
}
