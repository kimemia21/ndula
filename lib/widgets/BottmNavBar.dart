


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ndula/widgets/Homepage.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:simple_icons/simple_icons.dart';



class bottomNavBar extends StatefulWidget {
  const bottomNavBar({super.key});

  @override
  State<bottomNavBar> createState() => _bottomNavBarState();
}

class _bottomNavBarState extends State<bottomNavBar> {
  @override
  Widget build(BuildContext context) {

  PersistentTabController _controller;
  _controller = PersistentTabController(initialIndex: 1);






    List<Widget> _buildScreens() {
        return [

       
         
          Homepage(),
          Homepage(),
          Homepage()
            // ProfilePage()
        
        ];
    }





    
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [




            
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.cart_badge_plus),
                title: ("Content"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),

            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),

            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.person),
                title: ("Profile"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: const Color.fromARGB(255, 121, 121, 124),
            ),


        ];
    }



    
    
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
        
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.decelerate,
          duration: Duration(milliseconds: 400),
        ),
        navBarStyle: NavBarStyle.style12, // Choose the nav bar style with this property.
    );
    }  
}

