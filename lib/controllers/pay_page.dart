import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:get/get.dart';

class PayController extends GetxController {
  List<User> listOfUser = [
    User(name: "Mansur", phoneNumber: "+9989415835"),
    User(name: "Mansur1", phoneNumber: "+9989415835"),
    User(name: "Mansur2", phoneNumber: "+9989415835"),
  ];
  var isLoading = false;

  deleteUser(User user, BuildContext context) {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text("Delete user commen"),
            content: Text("Are you deleting!!!"),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(context);

                    isLoading = true;
                    update();

                    await Future.delayed(Duration(seconds: 3));
                    listOfUser.remove(user);

                    isLoading = false;
                    update();
                  },
                  child: Text("Delete")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close")),
            ],
          );
        });
  }

  addUser(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _phoneNumber = TextEditingController();
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text("Add user dialog"),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _name,
                    decoration: InputDecoration(helperText: "Name"),
                  ),
                  TextField(
                    controller: _phoneNumber,
                    decoration: InputDecoration(helperText: "Phone number"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    height: 50,
                    onPressed: () async {
                      var user = User(
                          name: _name.text, phoneNumber: _phoneNumber.text);
                      print(listOfUser);
                      Navigator.pop(context);

                      isLoading = true;
                      update();

                      await Future.delayed(Duration(seconds: 3));
                      listOfUser.add(user);

                      isLoading = false;
                      update();
                    },
                    color: Colors.blueAccent,
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
