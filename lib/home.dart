import 'package:flutter/material.dart';
import 'package:flutter_cakery_shop_ui/screen/cakery_page.dart';
import 'package:flutter_cakery_shop_ui/screen/drink_page.dart';
import 'package:flutter_cakery_shop_ui/widget/navbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:(BuildContext context, BoxConstraints constraints) {
        if(constraints.maxWidth <= 500){
          return const Home();
        } else {
          return const HomeWeb();
        }
      } 
    );
  }
}





class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Levineszz size: ${MediaQuery.of(context).size.width}',
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
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        children: [
          SizedBox(height: 2.0.h),
          Text('Menu',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 2.0.h),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: const Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 24),
              unselectedLabelColor: const Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Cake Box',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0.sp,
                      )),
                ),
                
                Tab(
                  child: Text('Drink',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 20.0.sp,
                      )),
                )
              ]),
          SizedBox(
            height: MediaQuery.of(context).size.height - 160.0.h,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: const [
                CakeryPage(),
                DrinkPage(),
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFF17532),
        child: const Icon(Icons.fastfood),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF545D68),
          ),
          onPressed: () {},
        ),
        title: Text(
          'Levine size: ${MediaQuery.of(context).size.width}',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 12.0.sp,
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
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        children: [
          SizedBox(height: 2.0.h),
          Text('Menu',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 5.0.sp,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 4.0.h),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: const Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(right: 24),
              unselectedLabelColor: const Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Cake Box',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 10.0.sp,
                      )),
                ),
                
                Tab(
                  child: Text('Drinkkk',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 10.0.sp,
                      )),
                ),
                
              ]),
              
          SizedBox(
            height: MediaQuery.of(context).size.height - 120.0.h,
            width: double.infinity,
            child: TabBarView(
              
              controller: _tabController,
              children: const [
                CakeryPage(),
                DrinkPage(),
              ],
              
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 235, 210, 196),
        child: const Icon(Icons.fastfood),
      ),
      bottomNavigationBar: const NavbarWidget(),
    );
  }
}
