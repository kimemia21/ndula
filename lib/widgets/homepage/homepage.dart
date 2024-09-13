import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ndula/widgets/AppHeight.dart';
import 'package:ndula/widgets/AppWidth.dart';
import 'package:ndula/widgets/Arrivals.dart';
import 'package:ndula/widgets/HomepagePopular.dart';
import 'package:ndula/widgets/Requests/Requests.dart';
import 'package:ndula/serializer/Shoe.dart';
import 'package:ndula/widgets/globals.dart';
import 'package:badges/badges.dart' as badges;
import 'package:ndula/widgets/homepage/ItemCart.dart';
import 'package:ndula/widgets/homepage/popular.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:simple_icons/simple_icons.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      Homepage(),
      Homepage(),
      Homepage(),
      Homepage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,

        // scrollController: ScrollController(),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const Homepage(),
            "/second": (final context) => const Homepage(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.bell),
        title: ("Notification"),
        activeColorPrimary: CupertinoColors.activeOrange,
        inactiveColorPrimary: CupertinoColors.systemGrey,

        // scrollController: ScrollController(),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const Homepage(),
            "/second": (final context) => const Homepage(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeGreen,
        inactiveColorPrimary: CupertinoColors.systemGrey,

        // scrollController: ScrollController(),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const Homepage(),
            "/second": (final context) => const Homepage(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Person"),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        // scrollController: _scrollController2,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: "/",
          routes: {
            "/first": (final context) => const Homepage(),
            "/second": (final context) => const Homepage(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double ScreenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Globals.textTheme(ScreenWidth);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.contain)),
      padding: const EdgeInsets.all(8.0),
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
        padding: const EdgeInsets.only(top: 8),
        backgroundColor: Colors.white,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 700),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 700),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle:
            NavBarStyle.style12, // Choose the nav bar style with this property
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Shoe>> _shoesFuture;

  @override
  void initState() {
    super.initState();
    _shoesFuture = Requests.requestProducts();
  }

  Future<void> _refreshShoes() async {
    setState(() {
      _shoesFuture = Requests.requestProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget display() {
      return RefreshIndicator(
        color: Colors.red.shade400,
        onRefresh: _refreshShoes,
        child: FutureBuilder<List<Shoe>>(
          future: _shoesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final shoes = snapshot.data!;

              return Container(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: Colors.grey.shade300,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.search,
                                  size: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "Search",
                                  style: GoogleFonts.poppins(
                                      fontSize: 18, color: Colors.black54),
                                ),
                              ),
                            ],
                          )),
                      Globals.homepageTitles(text: "Brand"),
                      SizedBox(
                        height: 10,
                      ),
                      Globals.displayCategory(context: context),
                      Globals.homepageTitles(text: "Categories"),
                      Container(
                        height: AppHeight(context, 0.35),
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: shoes.length,
                            itemBuilder: (context, index) {
                              return Itemcart(
                                  likes: shoes[index].likes,
                                  id: shoes[index].id,
                                  brand: shoes[index].brandName,
                                  name: shoes[index].name,
                                  imageUrl: shoes[index].image,
                                  description: shoes[index].description,
                                  price: shoes[index].price,
                                  onLikeChanged: () {
                                    _refreshShoes();
                                  });
                            }),
                      ),
                      Container(
                          margin: EdgeInsets.all(2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Globals.homepageTitles(text: "Popular"),
                              TextButton(
                                  onPressed: () {},
                                  child:
                                      Globals.homepageTitles(text: "Show all")),
                            ],
                          )),
                      Arrivals(),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(child: Text('No shoes found'));
            }
          },
        ),
      );
    }

    double ScreenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Globals.textTheme(ScreenWidth);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius:
                  30.0, // Set the radius (50.0 is equivalent to 100x100 diameter)
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/31/Virgil_Abloh_Paris_Fashion_Week_Autumn_Winter_2019_%28cropped%29.jpg/1200px-Virgil_Abloh_Paris_Fashion_Week_Autumn_Winter_2019_%28cropped%29.jpg'), // Replace with your image URL
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning",
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              Text("Username long", style: GoogleFonts.poppins(fontSize: 16))
            ],
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.rotation(
                    animationDuration: Duration(seconds: 1),
                    colorChangeAnimationDuration: Duration(seconds: 1),
                    loopAnimation: false,
                    curve: Curves.fastOutSlowIn,
                    colorChangeAnimationCurve: Curves.easeInCubic,
                  ),
                  badgeContent: Text('3'),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 30,
                  ),
                ))
          ],
        ),
        body: display());
  }
}
