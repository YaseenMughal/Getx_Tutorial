import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenTwo extends StatefulWidget {
  var name;

  ScreenTwo({super.key, this.name});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Screen Two'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Address:- " + Get.arguments[0],
                  style: TextStyle(fontSize: 20),
                ),
                Text("Password:- " + Get.arguments[1],
                    style: TextStyle(fontSize: 20)),
                SizedBox(height: Get.height * .1),
                ListTile(
                  title: Text('message'.tr),
                  subtitle: Text('name'.tr),
                ),
                SizedBox(
                  height: Get.height * .1,
                ),
                Row(
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Get.updateLocale(Locale('en', 'US'));
                        },
                        child: Text('English')),
                    SizedBox(width: Get.width * .2),
                    OutlinedButton(
                        onPressed: () {
                          Get.updateLocale(Locale('ur', 'PK'));
                        },
                        child: Text('Urdu'))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'message': 'What is your name?',
          'name': 'Muhammad Yaseen Ismail Mughal'
        },
        'ur_PK': {
          'message': 'آپ کا نام کیا ہے؟',
          'name': 'محمد یاسین اسماعیل مغل'
        }
      };
}

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar View'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rain here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}
