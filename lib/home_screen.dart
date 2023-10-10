import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen_one.dart';
import 'package:getx_tutorial/image_picker.dart';
import 'package:getx_tutorial/screen_two.dart';
import 'package:getx_tutorial/video_player.dart';

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
        title: const Text("GETX TUTORIAL"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // dialog box
            Card(
              child: ListTile(
                title: const Text("Alert Dialog Getx"),
                subtitle: const Text("Alert Dialog with the Getx"),
                onTap: () {
                  Get.defaultDialog(
                      title: "Delete Chat",
                      middleText: "Are you sure to delete the chat",
                      textConfirm: "Yes",
                      titlePadding: const EdgeInsets.only(top: 20),
                      contentPadding: const EdgeInsets.all(20),
                      textCancel: "No");
                },
              ),
            ),
            // bottom sheet
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Card(
                child: ListTile(
                  title: const Text("Bottom Sheet"),
                  subtitle: const Text("Bottom Sheet with the Getx"),
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
            customBox(navigate: ScreenOne(), text: "Text-Field's"),
            const SizedBox(height: 15),
            customBox(navigate: const TabView(), text: "TabBar"),
            const SizedBox(height: 15),
            customBox(navigate: const ImagePickerView(), text: "Image-Picker"),
            const SizedBox(height: 15),
            customBox(navigate: VideoPlayerView(), text: "Video-Player")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.snackbar("Yaseen Mughal", "Alhamdulillah for everything",
                snackStyle: SnackStyle.FLOATING,
                colorText: const Color.fromARGB(255, 238, 236, 234),
                backgroundColor: Colors.teal,
                snackPosition: SnackPosition.BOTTOM);
          }),
    );
  }
}

customBox({required Widget navigate, required String text}) {
  return InkWell(
    onTap: () {
      Get.to(navigate);
    },
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.teal,
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 25.0),
      )),
    ),
  );
}
