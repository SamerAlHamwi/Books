

import 'package:books/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class Permission {
  String name;
  bool isGranted;

  Permission({required this.name, required this.isGranted});
}

class UserPermissionsPage extends StatefulWidget {
  const UserPermissionsPage({super.key});

  @override
  State<UserPermissionsPage> createState() => _UserPermissionsPageState();
}

class _UserPermissionsPageState extends State<UserPermissionsPage> {

  List<Permission> permissions = [
    Permission(name: "My Group1", isGranted: false),
    Permission(name: "My Group2", isGranted: true),
    Permission(name: "My Group3", isGranted: false),
    Permission(name: "My Group4", isGranted: true),
    Permission(name: "My Group5", isGranted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Permissions",
          style: TextStyle(
            color: AppColor.black,
          ),
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: permissions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(permissions[index].name),
            trailing: Switch(
              value: permissions[index].isGranted,
              onChanged: (bool value) {
                setState(() {
                  permissions[index].isGranted = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}



