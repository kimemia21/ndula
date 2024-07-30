import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
      child: 
      
      FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        // onpress: (){},
        animationDuration: Duration(milliseconds: 200),
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
       
        

            FlashyTabBarItem(
            // onpress: (){},
            icon: Icon(SimpleIcons.shopee,size: MediaQuery.of(context).size.height*0.04,),
            title: Text('All'),
            activeColor: Colors.blue.shade200,
            inactiveColor: Color.fromARGB(255, 46, 46, 46),
          ),
        
          FlashyTabBarItem(
          
            icon: Icon(SimpleIcons.jordan,size: MediaQuery.of(context).size.height*0.04,),
            activeColor: Colors.blue.shade200,
            inactiveColor: Colors.black,
            title: Text('Jordan'),
          ),
          FlashyTabBarItem(
            icon: Icon(SimpleIcons.nike,size: MediaQuery.of(context).size.height*0.04,),
            title: Text('Nike'),
            activeColor: Colors.blue.shade200,
            inactiveColor: Colors.black,
          ),
          FlashyTabBarItem(
            icon: Icon(SimpleIcons.adidas,size: MediaQuery.of(context).size.height*0.04,),
            title: Text('adidas'),
            activeColor: Colors.blue.shade200,
            inactiveColor: Colors.black,
          ),
          FlashyTabBarItem(
            icon: Icon(SimpleIcons.puma,size: MediaQuery.of(context).size.height*0.04,),
            title: Text('Puma'),
            activeColor: Colors.blue.shade200,
            inactiveColor: Colors.black,
          ),
          // FlashyTabBarItem(
          //   icon: Icon(Icons.settings),
          //   title: Text('한국어'),
          // ),
        ],
      ),
    );
  }
}
