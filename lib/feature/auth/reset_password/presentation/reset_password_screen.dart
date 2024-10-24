import 'package:books/core/component/app_text_field.dart';
import 'package:books/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.contain,
                image: const AssetImage("assets/img_reset_password.png"),
              ),
              Text(
                "Reset\nPassword",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20,),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    obscureText: true,
                    prefix: Icon(Icons.lock_outline_rounded,size: 15,),
                    hint: "New Password",
                    suffix: Icon(Icons.remove_red_eye_outlined,size: 15,),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    obscureText: true,
                    prefix: Icon(Icons.lock_outline_rounded,size: 15,),
                    hint: "Confirm new Password",
                    suffix: Icon(Icons.remove_red_eye_outlined,size: 15,),
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: AppColor.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
