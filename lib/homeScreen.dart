import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mid2exam/bottomNavigation.dart';
import 'package:mid2exam/drawerMenu.dart';
import 'package:mid2exam/student.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController rollNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  List<Student> liststud = [];
  int _bootomIndex = 0;
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Student Management"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Center(
                child: Text("Add New Student",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: rollNoController,
                decoration: const InputDecoration(
                  labelText: "Enter Roll No ",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Enter Name ",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: "Enter City ",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    try {
                      if (rollNoController.text.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          cityController.text.isNotEmpty) {
                        var stud = Student();
                        stud.rollno =
                            int.parse(rollNoController.text.toString());
                        stud.name = nameController.text.toString();
                        stud.city = cityController.text.toString();
                        liststud.add(stud);
                        message = "Record Added !";
                        nameController.clear();
                        rollNoController.clear();
                        cityController.clear();
                      } else {
                        message = "Fill all fields !";
                      }
                    } catch (e) {
                      message = "$e";
                      nameController.clear();
                      rollNoController.clear();
                      cityController.clear();
                    }
                    // print(liststud.length);
                  });
                },
                child: const Text("Add Record"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(message),
            ],
          ),
        ),
      ),
      // drawer: const DrawerMenu(),
      bottomNavigationBar: BottomNavigation(
        list: liststud,
      ),
    );
  }
}
