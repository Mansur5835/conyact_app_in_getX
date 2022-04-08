import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/pay_page.dart';

class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PayController>(
      init: PayController(),
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
              children: List.generate(
                  Get.find<PayController>().listOfUser.length, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          Get.find<PayController>().listOfUser[index].name[0],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                          Get.find<PayController>().listOfUser[index].name),
                      subtitle: Text(Get.find<PayController>()
                          .listOfUser[index]
                          .phoneNumber),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.find<PayController>().deleteUser(
                                    Get.find<PayController>().listOfUser[index],
                                    context);
                              },
                              icon: Icon(
                                Icons.mode,
                                color: Colors.blueAccent,
                              )),
                          IconButton(
                              onPressed: () {
                                Get.find<PayController>().deleteUser(
                                    Get.find<PayController>().listOfUser[index],
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
                  Get.find<PayController>().addUser(context);
                },
                child: Icon(Icons.add, color: Colors.white)),
          ),
          Get.find<PayController>().isLoading
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
