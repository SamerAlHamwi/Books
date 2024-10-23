import 'package:books/core/component/app_text_field.dart';
import 'package:books/core/route/app_route_name.dart';
import 'package:books/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                height: 250,
                fit: BoxFit.contain,
                image: const AssetImage("assets/img_register.png"),
              ),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    prefix: Icon(Icons.person_outline,size: 15,),
                    hint: "Username",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    prefix: Icon(Icons.alternate_email_rounded,size: 15),
                    hint: "Email Address",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    prefix: Icon(Icons.phone_outlined,size: 15),
                    hint: "Phone Number",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    obscureText: true,
                    prefix: Icon(Icons.lock_outline_rounded,size: 15),
                    suffix: Icon(Icons.remove_red_eye_outlined,size: 15),
                    hint: "Password",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By signing up, you're agree to our ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "Terms & Condition",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColor.primaryColor),
                        ),
                        TextSpan(
                          text: " and ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: "privacy Policy",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRouteName.otp,
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
                          "Register",
                        style: TextStyle(
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
