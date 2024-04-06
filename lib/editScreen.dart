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
  int i = 0;

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
                  for (i = 0; i < length; i++) {
                    if (widget.list[i].rollno ==
                        int.parse(id.text.toString())) {
                      rollNoController.text = widget.list[i].rollno.toString();
                      nameController.text = widget.list[i].name.toString();
                      cityController.text = widget.list[i].city.toString();
                      // text = widget.list[i].toString();
                      print("${widget.list[i]}");
                    } else {
                      text = " No Student Found ! ";
                    }
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
                              widget.list[i].rollno =
                                  int.parse(rollNoController.text.toString());
                              widget.list[i].name =
                                  nameController.text.toString();
                              widget.list[i].city =
                                  cityController.text.toString();

                              print(nameController.text.toString());

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
