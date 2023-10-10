import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen_one.dart';
import 'package:getx_tutorial/screen_three.dart';
import 'package:getx_tutorial/screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("GETX TUTORIAL"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("Alert Dialog Getx"),
                subtitle: Text("Alert Dialog with the Getx"),
                onTap: () {
                  Get.defaultDialog(
                      title: "Delete Chat",
                      middleText: "Are you sure to delete the chat",
                      textConfirm: "Yes",
                      titlePadding: EdgeInsets.only(top: 20),
                      contentPadding: EdgeInsets.all(20),
                      textCancel: "No");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Card(
                child: ListTile(
                  title: Text("Bottom Sheet"),
                  subtitle: Text("Bottom Sheet with the Getx"),
                  onTap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)),
                            color: Colors.white),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.light_mode),
                              title: const Text("Light Mode"),
                              onTap: () {
                                Get.changeTheme(ThemeData.light());
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.dark_mode),
                              title: const Text("Dark Mode"),
                              onTap: () {
                                Get.changeTheme(
                                  ThemeData.dark(),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(ScreenOne());
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                child: const Center(
                    child: Text(
                  "Screen One",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(TabView());
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                child: const Center(
                    child: Text(
                  "TabBar",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                Get.to(ScreenThree());
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                child: const Center(
                    child: Text(
                  "Image-Picker",
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Yaseen Mughal", "Alhamdulillah for everything",
                snackStyle: SnackStyle.FLOATING,
                colorText: Color.fromARGB(255, 238, 236, 234),
                backgroundColor: Colors.teal,
                snackPosition: SnackPosition.BOTTOM);
          }),
    );
  }
}
