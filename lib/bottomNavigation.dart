import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mid2exam/homeScreen.dart';
import 'package:mid2exam/profileScreen.dart';
import 'package:mid2exam/student.dart';
import 'editScreen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.list});

  final List<Student> list;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _boxIndex = 0;

  // List<Student> list ;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (_boxIndex) {
          setState(() {
            switch (_boxIndex) {
              case 0:
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              case 1:
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditScreen(
                                list: widget.list,
                              )));
                }
              case 2:
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                                list: widget.list,
                              )));
                }
            }
          });
        },
        currentIndex: _boxIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: "Edit",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Profile",
          ),
        ]);
  }
}
