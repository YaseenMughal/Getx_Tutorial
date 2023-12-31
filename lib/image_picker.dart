import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  ImagePickerController controller = Get.put(ImagePickerController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image-Picker"),
          centerTitle: true,
        ),
        body: Obx(() {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 50.0,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(File(controller.imagePath.toString()))
                        : null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (controller == "") {
                            controller.getImage(ImageSource.gallery);
                          } else {
                            Get.defaultDialog(
                              title: "Alert-Permission!",
                              middleText: "Are you sure to open the Gallery?",
                              textCancel: "No",
                              textConfirm: "Yes",
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () {
                                Get.back();
                                controller.getImage(ImageSource.gallery);
                              },
                              titlePadding: const EdgeInsets.only(top: 20),
                              contentPadding: const EdgeInsets.all(20),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.image_outlined,
                          size: 50,
                        )),
                    const SizedBox(
                      width: 20.0,
                    ),
                    IconButton(
                        onPressed: () {
                          if (controller == "") {
                            controller.getImage(ImageSource.camera);
                          } else {
                            Get.defaultDialog(
                              title: "Alert-Permission!",
                              middleText: "Are you sure to open the Camera?",
                              textCancel: "No",
                              textConfirm: "Yes",
                              onCancel: () {
                                Get.back();
                              },
                              onConfirm: () {
                                Get.back();
                                controller.getImage(ImageSource.camera);
                              },
                              titlePadding: EdgeInsets.only(top: 20),
                              contentPadding: EdgeInsets.all(20),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 50,
                        )),
                  ],
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    if (controller.imagePath.isNotEmpty) {
                      Get.defaultDialog(
                          title: "",
                          backgroundColor: Colors.grey[400],
                          content: InteractiveViewer(
                            minScale: 1,
                            maxScale: 6,
                            child: Image(
                                image: FileImage(
                                    File(controller.imagePath.toString()))),
                          ));
                    } else {
                      Get.snackbar("Not Selected Image",
                          "Please select an image from gallery or camera!",
                          snackPosition: SnackPosition.BOTTOM,
                          snackStyle: SnackStyle.FLOATING);
                    }
                  },
                  child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: controller.imagePath.isNotEmpty
                          ? FileImage(File(controller.imagePath.toString()))
                          : null),
                ),
              ],
            ),
          );
        }));
  }
}

class ImagePickerController extends GetxController {
  RxString imagePath = ''.obs;
  Future getImage(sources) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: sources);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
