import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen_two.dart';

class ScreenOne extends StatefulWidget {
  ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Screen One"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Welcome To Get-X",
                  style: TextStyle(color: Colors.black, fontSize: 40.0)),
              SizedBox(height: 50),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email Address", border: OutlineInputBorder()),
              ),
              SizedBox(height: Get.height * .01),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: "Password", border: OutlineInputBorder()),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    Get.snackbar("", "All field's are mendatory",
                        snackStyle: SnackStyle.FLOATING,
                        colorText: Color.fromARGB(255, 238, 236, 234),
                        backgroundColor: Colors.teal,
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    Get.to(ScreenTwo(), arguments: [
                      emailController.text.toString(),
                      passwordController.text.toString()
                    ]);
                  }
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
                    "Screen Two",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
