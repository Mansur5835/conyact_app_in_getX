import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pay_page.dart';
import '../controllers/setting_controler.dart';
import '../services/di.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return GetX<SettingController>(
      init: SettingController(),
      builder: (c) => Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                "Provider app",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: ListView(
              children: List.generate(controller.listOfUser.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          controller.listOfUser[index].name[0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(controller.listOfUser[index].name),
                      subtitle: Text(controller.listOfUser[index].phoneNumber),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.deleteUser(
                                    controller.listOfUser[index], context);
                              },
                              icon: Icon(
                                Icons.mode,
                                color: Colors.blueAccent,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.find<SettingController>().deleteUser(
                                    Get.find<SettingController>()
                                        .listOfUser[index],
                                    context);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      height: 3,
                    )
                  ],
                );
              }),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  controller.addUser(context);
                },
                child: Icon(Icons.add, color: Colors.white)),
          ),
          controller.isLoading.isTrue
              ? Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
