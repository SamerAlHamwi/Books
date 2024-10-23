import 'package:books/core/component/app_text_field.dart';
import 'package:books/core/route/app_route_name.dart';
import 'package:books/core/theme/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
          left: 24,
          right: 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: MediaQuery.of(context).size.width,
                height: 250,
                fit: BoxFit.contain,
                image: const AssetImage("assets/img_login.png"),
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    prefix: Icon(Icons.alternate_email_rounded,size: 15,),
                    hint: "Email Address",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 24),
                  AppTextField(
                    obscureText: true,
                    prefix: Icon(Icons.lock_outline_rounded,size: 15,),
                    suffix: Icon(Icons.remove_red_eye_outlined,size: 15,),
                    hint: "Password",
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteName.forgotPassword,
                    );
                  },
                  child: Text(
                      "Forgot Password ?",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
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
                    "Login",
                    style: TextStyle(
                    color: AppColor.black,
                  ),
                  ),
                ),
              ),
              // backgroundColor: Color(0xFF1d3e66),
              const SizedBox(height: 10,),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an Account ? ",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: "Register here!",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              AppRouteName.register,
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
