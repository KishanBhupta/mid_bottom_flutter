import 'package:flutter/material.dart';
import 'package:mid2exam/bottomNavigation.dart';

import 'drawerMenu.dart';
import 'student.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.list});

  final List<Student> list;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController id = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String text = "";
  String message = "";
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Student Management"),
        backgroundColor: Colors.blueAccent,
      ),
      // drawer: DrawerMenu(),
      body: Column(
        children: [
          TextField(
            controller: id,
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  text = "";
                  print(widget.list);
                  int length = widget.list.length;
                  index = widget.list.indexWhere((element) =>
                      element.rollno == int.parse(id.text.toString()));
                  if ((index ?? -1) >= 0) {
                    // student found
                    rollNoController.text =
                        widget.list[index!].rollno.toString();
                    nameController.text = widget.list[index!].name.toString();
                    cityController.text = widget.list[index!].city.toString();
                  } else {
                    // index is -1 student not found
                    text = "Student record nto found...";
                  }
                });
              },
              child: Text("Find")),
          text != null && text == ""
              ? Column(
                  children: [
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
                              if (index != null) {
                                widget.list[index!].rollno =
                                    int.parse(rollNoController.text.toString());
                                widget.list[index!].name =
                                    nameController.text.toString();
                                widget.list[index!].city =
                                    cityController.text.toString();

                                nameController.clear();
                                rollNoController.clear();
                                cityController.clear();
                              }
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
                      child: const Text("Edit Records "),
                    ),
                  ],
                )
              : Text("$text"),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        list: widget.list,
      ),
    );
  }
}
