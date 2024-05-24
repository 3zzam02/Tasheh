import 'package:flutter/material.dart';
import 'package:tasheh/screens/events_page.dart';
import 'package:tasheh/screens/myeventspage.dart';
import 'package:tasheh/screens/profile_screen.dart';
import 'package:tasheh/screens/shop.dart';
import 'package:tasheh/screens/upload_screen.dart';
import 'coupons.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _MyButtomNavBarState();
}

class _MyButtomNavBarState extends State<NavBar> {
  var obj = CallBackClass();
  int myCurrentIndex = 2;
  List pages = const [
    up_screen(),
    MyEventPage(),
    EventPage(),
    Shop(),
    profile_screen(),
    CouponsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(8, 20))
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              //   backgroundColor: Colors.transparent,
              selectedItemColor: Colors.redAccent,
              unselectedItemColor: Colors.black,
              currentIndex: myCurrentIndex,
              onTap: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: "Add Event"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event), label: "Events"),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Shop"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline), label: "Profile"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_ind_outlined), label: "Sponsor"),
              ]),
        ),
      ),
      body: pages[myCurrentIndex],
    );
  }
}

void CallBackClass() {}
