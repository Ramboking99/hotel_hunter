import 'package:flutter/material.dart';
import 'package:hotelhunter/Models/appConstants.dart';
import 'package:hotelhunter/Screens/accountPage.dart';
import 'package:hotelhunter/Screens/explorePage.dart';
import 'package:hotelhunter/Screens/inboxPage.dart';
import 'package:hotelhunter/Screens/savedPage.dart';
import 'package:hotelhunter/Screens/tripsPage.dart';
import 'package:hotelhunter/Views/textWidgets.dart';


class GuestHomePage extends StatefulWidget {

  static final String routeName = '/guestHomePageRoute';

  GuestHomePage({Key key}) : super(key: key);

  @override
  _GuestHomePageState createState() => _GuestHomePageState();
}

class _GuestHomePageState extends State<GuestHomePage> {

  int _selectedIndex = 4;

  final List<String> _pageTitles = [
    'Explore',
    'Saved',
    'Trips',
    'Inbox',
    'Profile'
  ];

  final List<Widget> _pages = [
    ExplorePage(),
    SavedPage(),
    TripsPage(),
    InboxPage(),
    AccountPage(),
  ];

  BottomNavigationBarItem _buildNavigationItem(int index, IconData iconData, String text) {
    return BottomNavigationBarItem(
      icon: Icon(iconData, color: AppConstants.nonSelectedIconColor,),
      activeIcon: Icon(iconData, color: AppConstants.selectedIconColor,),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index ? AppConstants.selectedIconColor : AppConstants.nonSelectedIconColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTexts(text: _pageTitles[_selectedIndex]),
        automaticallyImplyLeading: false,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem> [
          _buildNavigationItem(0, Icons.search, _pageTitles[0]),
          _buildNavigationItem(1, Icons.favorite_border, _pageTitles[1]),
          _buildNavigationItem(2, Icons.hotel, _pageTitles[2]),
          _buildNavigationItem(3, Icons.message, _pageTitles[3]),
          _buildNavigationItem(4, Icons.person_outline, _pageTitles[4]),

        ],
      ),
    );
  }
}
