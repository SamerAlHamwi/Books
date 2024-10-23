

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/theme/app_color.dart';
import '../../widgets/user_widget.dart';


class UsersPage extends StatefulWidget {


  const UsersPage({ super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }
  Widget getAppBar(){
    return AppBar(
      backgroundColor: AppColor.white,
      elevation: 0,
      leading: const SizedBox(),
      title: Text("Users",style: TextStyle(
          color: AppColor.black,
          fontSize: 17
      ),),
    );
  }

  Widget getBody(){
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getItemLists()
        ],
      ),
    );
  }

  Widget getItemLists(){
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(9, (index) {
          return const UserWidget();
        }),
      ),
    );
  }
}