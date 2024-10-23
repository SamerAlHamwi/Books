


import 'package:books/core/component/app_text_field.dart';
import 'package:books/core/route/app_route_name.dart';
import 'package:books/core/theme/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AddGroupScreen extends StatelessWidget {
  const AddGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Group'),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/add-group.png"),
              ),
              Text(
                "Add group",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const AppTextField(
                prefix: Icon(Icons.group,size: 15,),
                hint: "Group name",
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 150,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteName.home,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
