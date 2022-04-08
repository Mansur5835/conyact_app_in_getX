import 'package:flutter/material.dart';
import 'package:provider_app/controllers/home_controller.dart';
import 'package:provider_app/controllers/main_controller.dart';
import 'package:provider_app/models/user.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
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
              children: List.generate(
                  Get.find<MainController>().listOfUser.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          Get.find<MainController>().listOfUser[index].name[0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                          Get.find<MainController>().listOfUser[index].name),
                      subtitle: Text(Get.find<MainController>()
                          .listOfUser[index]
                          .phoneNumber),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.mode,
                                color: Colors.blueAccent,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.find<MainController>().deleteUser(
                                    Get.find<MainController>()
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
                  Get.find<MainController>().addUser(context);
                },
                child: Icon(Icons.add, color: Colors.white)),
          ),
          Get.find<MainController>().isLoading.isTrue
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
