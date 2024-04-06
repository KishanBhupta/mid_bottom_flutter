import 'package:flutter/material.dart';

import 'bottomNavigation.dart';
import 'drawerMenu.dart';
import 'student.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.list});

  final List<Student> list;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Student Management"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: widget.list.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {
                widget.list.removeAt(index);
              });
            },
            leading: Icon(Icons.person),
            trailing: Icon(Icons.delete),
            title: Text("${widget.list[index].name}"),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(
        list: widget.list,
      ),
    );

    // drawer: DrawerMenu(),
  }
}
