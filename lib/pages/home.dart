import 'package:flutter/material.dart';
import 'package:provider_app/controllers/home_controller.dart';
import 'package:provider_app/models/user.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());

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
                "GetX app",
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
                                controller.editUser(
                                  context,
                                  controller.listOfUser[index],
                                );
                              },
                              icon: Icon(
                                Icons.mode,
                                color: Colors.blueAccent,
                              )),
                          IconButton(
                              onPressed: () {
                                controller.deleteUser(
                                    controller.listOfUser[index], context);
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
